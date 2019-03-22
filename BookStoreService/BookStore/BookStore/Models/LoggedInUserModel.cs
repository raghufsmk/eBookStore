using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BookStore.Models
{
    public class LoggedInUserModel
    {
        public int CustomerID { get; set; }
        public string Firstname { get; set; }
        public string Username { get; set; }
    }
}