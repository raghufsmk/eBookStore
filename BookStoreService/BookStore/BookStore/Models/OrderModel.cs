using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace BookStore.Models
{
    public class OrderModel
    {
        public Boolean PlaceOrder(OrderDataModel orderData)
        {
            DAL objDal = new DAL();
            MySqlConnection mySqlConnect = new MySqlConnection();
            mySqlConnect = objDal.GetConnection();
            mySqlConnect.Open();
            try
            {
                MySqlCommand placeOrderCmd = mySqlConnect.CreateCommand();
                //DateTime dt = new DateTime();
                //string currentDate = String.Format("{0:yyyy-MM-dd}", dt);
                string currentDate = DateTime.Now.ToString("yyyy-MM-dd");
                // Insert into tbl_order
                placeOrderCmd.CommandText = "INSERT INTO tbl_orders(order_date, cust_id, order_status) VALUES('" + currentDate + "', '" + orderData.cust_id + "', 'placed')";
                placeOrderCmd.ExecuteNonQuery();
                placeOrderCmd.CommandText = "SELECT order_id FROM tbl_orders WHERE cust_id='" + orderData.cust_id + "' AND order_date='" + currentDate + "';";
                MySqlDataAdapter dataAdap = new MySqlDataAdapter(placeOrderCmd);
                //DataSet ds = new DataSet();
                DataTable dtOrderId = new DataTable();
                dataAdap.Fill(dtOrderId);
                string strOrderID = dtOrderId.Rows[0]["order_id"].ToString();
                // Add Order details
                string addOrderDetails = null; ;
                foreach (ProductDataModel product in orderData.products)
                {
                    addOrderDetails += "INSERT INTO tbl_order_details (order_id, isbn, quantity) VALUES ('" + strOrderID + "','" + product.isbn + "','" + product.quantity + "'  ); ";
                }
                placeOrderCmd.CommandText = addOrderDetails;
                placeOrderCmd.ExecuteNonQuery();
                //DataTable dt = new DataTable();
                //dt.DataSource = ds.Tables[0].DefaultView;
                //object userObject = Utilities.Utilities.DataTableToJSONWithJSONNet(userTable);
                mySqlConnect.Close();
                //return userObject;
                return true;
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}