using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BookStore.Models;
using System.Data;

namespace BookStore.Controllers
{
    public class CatalogController : ApiController
    {
        [HttpGet]
        [AllowAnonymous]
        public HttpResponseMessage Catalog()
        {
            try
            {
                CatalogModel objCatalogModel = new CatalogModel();
                //object allBooks;
                //// Get logged in user data
                //allBooks = objCatalogModel.GetCatalog();
                //var response = Request.CreateResponse(allBooks);
                //return response;

                //BookModel objCatalogModel = new BookModel();
                List<BookModel> bookData = new List<BookModel>();

                DataTable ds = new DataTable();
                ds = objCatalogModel.GetCatalog();

                bookData = (from DataRow dr in ds.Rows
                               select new BookModel()
                               {
                                   author_id = Convert.ToInt32(dr["author_id"]),
                                   language = dr["language"].ToString(),
                                   supplier = dr["supplier"].ToString(),
                                   price = Convert.ToInt32(dr["price"]),
                                   isbn = Convert.ToInt64(dr["isbn"]),
                                   publish_year = dr["publish_year"].ToString(),
                                   subject = dr["subject"].ToString(),
                                   format = dr["format"].ToString(),
                                   keywords = dr["keywords"].ToString(),
                                   available_copies = Convert.ToInt32(dr["available_copies"]),
                                   publisher = dr["publisher"].ToString(),
                                   title = dr["title"].ToString(),
                                   image = dr["image"].ToString()
                               }).ToList();
                var response = Request.CreateResponse(bookData);
                return response;
                //objCatalogModel.Data
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
