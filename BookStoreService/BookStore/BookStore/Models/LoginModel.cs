using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Newtonsoft.Json;
using BookStore.Utilities;

namespace BookStore.Models
{
    public class LoginModel
    {
        public DataTable Login(UserModel loginCredentials)
        {
            DAL objDal = new DAL();
            MySqlConnection mySqlConnect = new MySqlConnection();
            mySqlConnect = objDal.GetConnection();
            mySqlConnect.Open();
            try
            {
                MySqlCommand loginCmd = mySqlConnect.CreateCommand();
                loginCmd.CommandText = "SELECT cust_id, firstname, username FROM tbl_customer WHERE username = '" + loginCredentials.Username + "' AND password = '" + loginCredentials.Password + "'";
                MySqlDataAdapter dataAdap = new MySqlDataAdapter(loginCmd);
                //DataSet ds = new DataSet();
                DataTable userTable = new DataTable();
                dataAdap.Fill(userTable);
                //DataTable dt = new DataTable();
                //dt.DataSource = ds.Tables[0].DefaultView;
                //object userObject = Utilities.Utilities.DataTableToJSONWithJSONNet(userTable);
                mySqlConnect.Close();
                //return userObject;
                return userTable;
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}