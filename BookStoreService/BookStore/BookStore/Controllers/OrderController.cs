using BookStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace BookStore.Controllers
{
    public class OrderController : ApiController
    {
        //[EnableCors]
        [HttpPost]
        public HttpResponseMessage Order([FromBody]OrderDataModel orderData)
        {

            try
            {
                OrderModel objOrder = new OrderModel();
                bool blnStatus = objOrder.PlaceOrder(orderData);
                var response = Request.CreateResponse(blnStatus);
                return response;
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
