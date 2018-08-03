using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace training.Utility
{
    public class DBConnection
    {
       
            private static string ConStr_Sql
            {
                get
                {
                    try
                    {
                        return ConfigurationManager.ConnectionStrings["SQLCONN"].ConnectionString.ToString();
                    }
                    catch (Exception ex)
                    {
                        return "";
                    }
                }
            }
            public static int int_ExecuteNonQuery_Sql(string sql)
            {
                int ReturnValue = 0;
                SqlConnection con = new SqlConnection(ConStr_Sql);
                try
                {

                    SqlCommand cmd = new SqlCommand(sql, con);
                    con.Open();
                    ReturnValue = cmd.ExecuteNonQuery();

                }
                catch (System.Exception ex)
                {
                    return 0;

                }
                finally
                {
                    con.Close();
                }
                return ReturnValue;
            }
            public static DataTable _DataTable_sql(string sql)
            {
                DataTable ReturnValue = new DataTable();
                try
                {

                    SqlConnection con = new SqlConnection(ConStr_Sql);

                    if (con.State == ConnectionState.Closed)
                        con.Open();

                    SqlDataAdapter x = new SqlDataAdapter(sql, con);
                    if (con.State == ConnectionState.Open)
                        con.Close();
                    x.Fill(ReturnValue);
                }
                catch (System.Exception ex)
                {


                }
                return ReturnValue;
            }
        } //
    }
