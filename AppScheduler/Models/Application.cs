using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AppScheduler.Models
{
    public class Application
    {
        #region Constructors
        public Application()
        {
        }
        internal Application(MySql.Data.MySqlClient.MySqlDataReader dr)
        {
            Fill(dr);
        }

        #endregion

        #region Private Variables
        private int _AppID;
        private string _AppName;
        #endregion

        #region Public Variables
        public int AppID
        {
            get { return _AppID; }
            set { _AppID = value; }
        }

        public string AppName
        {
            get { return _AppName; }
            private set { _AppName = value; }
        }
        #endregion

        #region Database String
        internal const string db_AppID = "ID";
        internal const string db_AppName = "AppName";
        #endregion

        #region Public Subs
        /// <summary>
        /// Modified date: 04/29/2019
        /// Modified by: shreelvi
        /// Added code to handle mysql data reader null column values
        /// Reference: https://stackoverflow.com/questions/1772025/sql-data-reader-handling-null-column-values
        /// </summary>
        /// <param name="dr"></param>
        public void Fill(MySqlDataReader dr)
        {
            _AppID = dr.GetInt32(db_AppID);
            _AppName = dr.GetString(db_AppName);
            
        }
        #endregion
    }
}
