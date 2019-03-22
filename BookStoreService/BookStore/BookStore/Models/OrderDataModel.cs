using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BookStore.Models
{
    public class OrderDataModel
    {
        public ProductDataModel[] products { get; set; }
        public int cust_id { get; set; }
    }
}