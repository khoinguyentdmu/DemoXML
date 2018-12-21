using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace DemoXML
{
    public partial class Manage_Book : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;

            LoadData(); 

            /*XmlWriterSettings settings = new XmlWriterSettings();
            settings.Indent = true;

            XmlWriter xmlWriter = XmlWriter.Create("D:\\StudyDocuments\\TDMU_4Years\\Nam4_HK1\\CongNgheXMLVaUngDung\\Final\\DemoXML\\DemoXML\\" + "data.xml", settings);
            doc.Save(xmlWriter);*/

        }

        public void LoadData()
        {
            DataSet dsresult = new DataSet();
            XmlDocument doc = new XmlDocument();
            XmlReader xmlReader = XmlReader.Create(Server.MapPath("./") + "/data.xml");
            XmlElement exelement;

            doc.Load(xmlReader);
            xmlReader.Close();

            exelement = doc.DocumentElement;

            if (exelement != null)
            {
                XmlNodeReader nodereader = new XmlNodeReader(exelement);
                dsresult.ReadXml(nodereader, XmlReadMode.Auto);
                GridView1.DataSource = dsresult;
                GridView1.DataBind();
            }
            else
            {
                GridView1.DataSource = null;
                GridView1.DataBind();
            }

        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = GridView1.DataKeys[e.RowIndex].Value.ToString();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            LoadData();
        }
    }
}