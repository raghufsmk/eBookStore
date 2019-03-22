using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BookStore.Models
{
    public class BookModel
    {
        public int author_id { get; set; }
        public string language { get; set; }
        public string supplier { get; set; }
        public float price { get; set; }
        public long isbn { get; set; }
        public string publish_year { get; set; }
        public string subject { get; set; }
        public string format { get; set; }
        public string keywords { get; set; }
        public int available_copies { get; set; }
        public string publisher { get; set; }
        public string title { get; set; }
        public string image { get; set; }
    }
}