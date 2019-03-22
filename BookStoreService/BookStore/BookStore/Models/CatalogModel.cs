using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace BookStore.Models
{
    public class CatalogModel
    {
        public DataTable GetCatalog()
        {
            DAL objDal = new DAL();
            MySqlConnection mySqlConnect = new MySqlConnection();
            mySqlConnect = objDal.GetConnection();
            mySqlConnect.Open();
            try
            {
                MySqlCommand bookCmd = mySqlConnect.CreateCommand();
                bookCmd.CommandText = "SELECT * FROM tbl_book";
                MySqlDataAdapter dataAdap = new MySqlDataAdapter(bookCmd);
                //DataSet ds = new DataSet();
                DataTable allBooks = new DataTable();
                dataAdap.Fill(allBooks);
                //DataTable dt = new DataTable();
                //dt.DataSource = ds.Tables[0].DefaultView;
                //object allBooksObject = Utilities.Utilities.DataTableToJSONWithJSONNet(allBooks);
                mySqlConnect.Close();
                //return allBooksObject;
                return allBooks;
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}