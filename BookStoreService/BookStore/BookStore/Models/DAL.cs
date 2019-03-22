using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace BookStore.Models
{
    public class DAL
    {
        public string ConnectionString { get; set; }

        public DAL()
        {
            this.ConnectionString = ConfigurationManager.AppSettings["myConnectionString"].ToString();
        }

        public MySqlConnection GetConnection()
        {
            return new MySqlConnection(ConnectionString);
        }
    }
}