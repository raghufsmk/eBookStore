using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BookStore.Models;
using System.Data;
using Newtonsoft.Json;
using BookStore.Utilities;
using System.Web.Http.Cors;

namespace BookStore.Controllers
{
    //[EnableCors(origins: "http://localhost:4200/", headers: "*", methods: "*")]
    public class LoginController : ApiController
    {
        [HttpPost]
        [AllowAnonymous]
        public HttpResponseMessage AuthenticateUser([FromBody]UserModel loginUserData)
        {
            // To store authentication response as JSON
            AuthenticationResponse authResponseObject = new AuthenticationResponse();

            authResponseObject.token = null;
            authResponseObject.error = null;

            try
            {
                LoginModel objLoginModel = new LoginModel();
                List<UserModel> loggedInUser= new List<UserModel>();
                DataTable dtUser = new DataTable();
                // Get logged in user data
                dtUser = objLoginModel.Login(loginUserData);
                // Create JWT token
                authResponseObject.token = JwtManager.GenerateToken(loginUserData.Username);
                // Storing authentication token into server session to validate the next service calls
                //SessionHelper.SetInSession(SessionKeys.AuthUserToken, authResponseObject.token);

                loggedInUser = (from DataRow dr in dtUser.Rows
                                select new UserModel()
                                {
                                    Username = dr["username"].ToString(),
                                    cust_id = Convert.ToInt32(dr["cust_id"]),
                                    firstname = dr["firstname"].ToString(),
                                    authToken = authResponseObject.token.ToString()
                            }).ToList();

                var response = Request.CreateResponse(loggedInUser);
                //response.Headers.Add("auth-token", authResponseObject.token);
                
                return response;
                //return Ok(loggedInUser);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }

    public class AuthenticationResponse
    {
        /// <summary>
        /// Authentication token 
        /// </summary>
        public string token { get; set; }
        /// <summary>
        /// Error message 
        /// </summary>
        public string error { get; set; }
        /// <summary>
        /// Permissions provided for user
        /// </summary>
        public string Permissions { get; set; }
    }
}
