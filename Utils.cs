using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace jobportal
{
    public class Utils
    {
        public static bool IsValidExtention(string fileName)
        {
            bool isValid = false;
            string[] fileExtention = { ".jpg", ".png", ".jpeg" };
            for (int i = 0; i <= fileExtention.Length - 1; i++)
            {
                if (fileName.Contains(fileExtention[i]))
                {
                    isValid = true;
                    break;
                }
            }
            return isValid;
        }


        public static bool IsValidExtention4Resume(string fileName)
        {
            bool isValid = false;
            string[] fileExtention = { ".doc", ".docx", ".pdf" };
            for (int i = 0; i <= fileExtention.Length - 1; i++)
            {
                if (fileName.Contains(fileExtention[i]))
                {
                    isValid = true;
                    break;
                }
            }
            return isValid;
        }
    }
}