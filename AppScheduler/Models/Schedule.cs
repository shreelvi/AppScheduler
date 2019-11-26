using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AppScheduler.Models
{
    public class Schedule
    {
        #region Constructors
        public Schedule()
        {
        }
        internal Schedule(MySql.Data.MySqlClient.MySqlDataReader dr)
        {
            Fill(dr);
        }

        #endregion

        #region Private Variables
        private int _JobsID;
        private int _AppID;
        private string _AppName;
        private TimeSpan _Time;
        private string _Day;
        private string _Success;
        private int _FilesDwup;
        private int _FilesSorted;
        private Application _Application;
        #endregion

        #region Public Variables
        public int JobsID
        {
            get { return _JobsID; }
            set { _JobsID = value; }
        }

        public int AppID
        {
            get { return _AppID; }
            set { _AppID = value; }
        }

        public string AppName
        {
            get { return _AppName; }
            set { _AppName = value; }
        }

        public Application App
        {
            get { return _Application; }
            set { _Application = value; }
        }

        public TimeSpan Time
        {
            get { return _Time; }
            private set { _Time = value; }
        }

        public string Day
        {
            get { return _Day; }
            set { _Day = value; }
        }

        public string Success
        {
            get { return _Success; }
            set { _Success = value; }
        }

        public int FilesDwup
        {
            get { return _FilesDwup; }
            set { _FilesDwup = value; }
        }

        public int FilesSorted
        {
            get { return _FilesSorted; }
            set { _FilesSorted = value; }
        }
        #endregion

        #region Database String
        internal const string db_AppID = "AppID";
        internal const string db_JobID = "JobsID";
        internal const string db_AppName = "AppName";
        internal const string db_Time = "Time";
        internal const string db_Day = "Day";
        internal const string db_Success = "Success";
        internal const string db_FilesDwup = "Files_DwUp";
        internal const string db_FilesSorted = "Files_Sorted";
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
            _JobsID = dr.GetInt32(db_JobID);
            _Time = dr.GetTimeSpan(db_Time);
            _Day = dr.GetString(db_Day);
            _Success = dr.GetString(db_Success);
            _FilesDwup = dr.GetInt32(db_FilesDwup);
            _FilesSorted = dr.GetInt32(db_FilesSorted);

        }
        #endregion
    }
}
