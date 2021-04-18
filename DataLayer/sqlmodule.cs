using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DataLayer
{
    public class sqlmodule
    {
        //private readonly string conStringInventory=
        SqlConnection connection;
        private readonly string conString = "Data Source=LAPTOP-9JGR6IFT\\SQLEXPRESS;Initial Catalog = ThinkBridge_inventory; Integrated Security = true; Max Pool Size=50000;Pooling=True";        
        public SqlConnection GetConnection()
        {

            connection = new SqlConnection(conString);
            connection.Open();
            return connection;
        }
        public int SqlExecutenonQuery(string Query)
        {
            sqlmodule objecct = new sqlmodule();
            SqlConnection con = objecct.GetConnection();
            SqlCommand cmd = new SqlCommand(Query, con);
            string sqlQuery = Query.ToLower();
            int retValue = cmd.ExecuteNonQuery();
            con.Close();
            return retValue;
        }

        public SqlDataReader ExecuteReader(string Query)
        {
            sqlmodule objecct = new sqlmodule();
            SqlConnection con = objecct.GetConnection();
            SqlCommand cmd = new SqlCommand(Query, con);
            string sqlQuery = Query.ToLower();
            SqlDataReader dr = cmd.ExecuteReader();            
            return dr;
        }


        public Object ExecuteScalar(string Query, string constring)
        {
            {
                SqlConnection con = GetConnection();
                SqlCommand cmd = new SqlCommand(Query, con);
                Object Scalar = cmd.ExecuteScalar();
                con.Close();
                return Scalar;
            }
        }
        SqlDataReader query = null; readonly int count = 0;
        public SqlDataReader SqlFunction(string operation, string tableName, string[] columnName, object[] value, int length, string condition)
        {
            switch (operation)
            {
                case "select":
                    query = SelectOperation(columnName, tableName, length, condition);
                    break;
                case "insert":
                    query = InsertTable(tableName, columnName, value, length);
                    break;
                case "update":
                    query = UpdateTable(tableName, columnName, value, length, condition);
                    break;
                case "delete":
                    query = DeleteTable(tableName, condition);
                    break;

            }
            return query;
        }
        public SqlDataReader SelectOperation(string[] columnName, string tableName, int length, string condition)
        {
            String empty = "";
            String queryNew = "select ";
            string query = "";
            for (int ColumnCount = count; ColumnCount < length; ColumnCount++)
            {
                queryNew = queryNew + columnName[ColumnCount];
                query = queryNew;
                queryNew = queryNew + ", ";
            }
            if (condition == empty)
                query = query + " from " + tableName;
            else
                query = query + " from " + tableName + " where " + condition;
            return ExecuteReader(query);
        }

        public SqlDataReader InsertTable(string tableName, string[] columnName, object[] value, int length)
        {
            SqlDataReader insert = null;
            String queryNew = "";
            string query = "", queryy = "";
            queryNew = "insert into " + tableName + "(";
            for (int ColumnCount = count; ColumnCount < length; ColumnCount++)
            {
                queryNew = queryNew + columnName[ColumnCount];
                query = queryNew;
                queryNew = queryNew + ", ";
            }
            query = query + ") values (";
            for (int ValueCount = count; ValueCount < length; ValueCount++)
            {
                query = query + "'" + value[ValueCount] + "'";
                queryy = query;
                query = query + ", ";
            }
            queryy = queryy + ")";
            SqlExecutenonQuery(queryy);
            return insert;

        }
        public SqlDataReader UpdateTable(String tableName, String[] columnName, object[] value, int length, String condition)
        {
            SqlDataReader update = null;
            String queryNew = "";
            string query = "";
            queryNew = "update " + tableName + " set ";
            for (int ColumnCount = count; ColumnCount < length; ColumnCount++)
            {
                queryNew = queryNew + columnName[ColumnCount] + "=" + "'" + value[ColumnCount] + "'";
                query = queryNew;
                queryNew = queryNew + ", ";
            }
            query = query + " where " + condition;
            SqlExecutenonQuery(query);
            return update;
        }

        public SqlDataReader DeleteTable(String tableName, String condition)
        {
            SqlDataReader delete = null;
            String queryNew = "";
            String empty = "";
            if (condition == empty)
                queryNew = "delete from " + tableName;
            else
                queryNew = "delete from " + tableName + " where " + condition;
            SqlExecutenonQuery(queryNew);
            return delete;
        }
    }
}
