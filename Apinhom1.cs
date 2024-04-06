using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Data.SqlClient;
using System.Configuration;

namespace ListStudent
{
    public class StudentMajorController : ApiController
    {
        // GET api/studentmajor/{maSinhVien}
        [HttpGet]
        [Route("api/studentmajor/{maSinhVien}")]
        public IHttpActionResult GetStudentMajor(string maSinhVien)
        {
            // Connection string
            string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;

            // Query to get student's majors
            string query = @"SELECT Major.MaNganh, Major.TenNganh, StudentMajor.NgayDangKy, DepartmentSubject.TenBoMon
                             FROM StudentMajor
                             INNER JOIN Major ON StudentMajor.MaNganh = Major.MaNganh
                             INNER JOIN DepartmentSubject ON Major.MaBoMon = DepartmentSubject.MaBoMon
                             WHERE StudentMajor.MaSinhVien = @MaSinhVien";

            // List to store result
            List<object> studentMajors = new List<object>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@MaSinhVien", maSinhVien);

                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    // Read the result set and add to list
                    while (reader.Read())
                    {
                        studentMajors.Add(new
                        {
                            MaNganh = reader["MaNganh"].ToString(),
                            TenNganh = reader["TenNganh"].ToString(),
                            NgayDangKy = reader["NgayDangKy"].ToString(),
                            TenBoMon = reader["TenBoMon"].ToString()
                        });
                    }

                    reader.Close();
                }
                catch (Exception ex)
                {
                    return BadRequest("Error occurred: " + ex.Message);
                }
            }

            // Return the list of student's majors
            return Ok(studentMajors);
        }
    }
}
