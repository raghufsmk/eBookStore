using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BookStore.Models
{
    public class UserModel
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public int cust_id { get; set; }
        public string firstname { get; set; }
        public string authToken { get; set; }

    }
}