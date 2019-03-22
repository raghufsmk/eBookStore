using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace BookStore.Models
{
    public class OrderModel
    {
        public Int32 PlaceOrder(OrderDataModel orderData)
        {
            DAL objDal = new DAL();
            MySqlConnection mySqlConnect = new MySqlConnection();
            mySqlConnect = objDal.GetConnection();
            mySqlConnect.Open();
            int orderCount = 0;
            try
            {
                MySqlCommand placeOrderCmd = new MySqlCommand("sp_place_order", mySqlConnect);
                placeOrderCmd.CommandType = CommandType.StoredProcedure;

                MySqlParameter par1 = new MySqlParameter("@cust_id", MySqlDbType.Int32);
                par1.Direction = ParameterDirection.Input;
                par1.Value = orderData.cust_id;
                placeOrderCmd.Parameters.Add(par1);

                MySqlParameter par2 = new MySqlParameter("@products", MySqlDbType.JSON);
                par2.Direction = ParameterDirection.Input;
                par2.Value = JsonConvert.SerializeObject(orderData.products);
                placeOrderCmd.Parameters.Add(par2);

                MySqlParameter par3 = new MySqlParameter("@out_order_details_count", MySqlDbType.Int32);
                par3.Direction = ParameterDirection.Output;
                placeOrderCmd.Parameters.Add(par3);

                placeOrderCmd.ExecuteNonQuery();

                orderCount = Convert.ToInt32(placeOrderCmd.Parameters["@out_order_details_count"].Value.ToString());

                mySqlConnect.Close();
                
                return orderCount;
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}