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
        //https://docs.microsoft.com/en-us/dotnet/api/system.xml.xmlnode.replacechild?view=netframework-4.7.2

        private string fileNameXML = "data.xml";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;

            LoadDataToGridView(LoadDataFromXMlFile());
        }

        private void SaveDataToXMLFile(XmlDocument doc)
        {
            XmlWriterSettings settings = new XmlWriterSettings();
            settings.Indent = true;

            XmlWriter xmlWriter = XmlWriter.Create(Server.MapPath("./") + "/" + fileNameXML, settings);
            doc.Save(xmlWriter);
            xmlWriter.Close();
        }

        public XmlDocument LoadDataFromXMlFile()
        {
            XmlDocument doc = new XmlDocument();
            XmlReader xmlReader = XmlReader.Create(Server.MapPath("./") + "/" + fileNameXML);
           
            doc.Load(xmlReader);
            xmlReader.Close();
            return doc;
        }

        public void LoadDataToGridView(XmlDocument doc)
        {
            DataSet dsresult = new DataSet();
            XmlElement exelement;

            exelement = doc.DocumentElement;
            if (exelement != null)
            {
                XmlNodeReader nodereader = new XmlNodeReader(exelement);
                dsresult.ReadXml(nodereader, XmlReadMode.Auto);
                if (dsresult.Tables.Count <= 0) dsresult = null;
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
            LoadDataToGridView(LoadDataFromXMlFile());
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = GridView1.DataKeys[e.RowIndex].Value.ToString();
            XmlDocument doc = LoadDataFromXMlFile();
            XmlElement root = doc.DocumentElement;

            XmlNode curNode = root.FirstChild;
            while (curNode != null)
            {
                if (curNode.Attributes["Id"].Value.Equals(id) == true)
                {
                    root.RemoveChild(curNode);
                    break;
                }
                curNode = curNode.NextSibling;
            }

            SaveDataToXMLFile(doc);
            LoadDataToGridView(LoadDataFromXMlFile());
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string id = GridView1.DataKeys[e.RowIndex].Value.ToString();
            string bookName = (GridView1.Rows[e.RowIndex].Cells[1].Controls[0] as TextBox).Text;
            string categoryBook = (GridView1.Rows[e.RowIndex].Cells[2].Controls[0] as TextBox).Text;
            string author = (GridView1.Rows[e.RowIndex].Cells[3].Controls[0] as TextBox).Text;
            string publisher = (GridView1.Rows[e.RowIndex].Cells[4].Controls[0] as TextBox).Text;
            string price = (GridView1.Rows[e.RowIndex].Cells[5].Controls[0] as TextBox).Text;

            XmlDocument doc = LoadDataFromXMlFile();
            XmlElement root = doc.DocumentElement;

            XmlNode curNode = root.FirstChild;
            while (curNode != null)
            {
                if (curNode.Attributes["Id"].Value.Equals(id) == true)
                {
                    curNode.ChildNodes[0].InnerText = bookName;
                    curNode.ChildNodes[1].InnerText = categoryBook;
                    curNode.ChildNodes[2].InnerText = author;
                    curNode.ChildNodes[3].InnerText = publisher;
                    curNode.ChildNodes[4].InnerText = price;
                    break;
                }
                curNode = curNode.NextSibling;
            }

            GridView1.EditIndex = -1;
            SaveDataToXMLFile(doc);
            LoadDataToGridView(LoadDataFromXMlFile());
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            LoadDataToGridView(LoadDataFromXMlFile());
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            string id = txtId.Text;
            string bookName = txtName.Text;
            string categoryBook = txtCategoryBook.Text;
            string author = txtAuthor.Text;
            string publisher = txtPublisher.Text;
            string price = txtPrice.Text;

            XmlDocument doc = LoadDataFromXMlFile();
            XmlElement root = doc.DocumentElement;

            XmlElement ele1 = doc.CreateElement("Book");
            ele1.SetAttribute("Id", id);

            XmlNode bookNameNode = doc.CreateNode(XmlNodeType.Element, "Name", "");
            bookNameNode.InnerText = bookName;
            ele1.AppendChild(bookNameNode);

            XmlNode categoryBookNode = doc.CreateNode(XmlNodeType.Element, "CategoryBook", "");
            categoryBookNode.InnerText = categoryBook;
            ele1.AppendChild(categoryBookNode);

            XmlNode authorNode = doc.CreateNode(XmlNodeType.Element, "Author", "");
            authorNode.InnerText = author;
            ele1.AppendChild(authorNode);

            XmlNode publisherNode = doc.CreateNode(XmlNodeType.Element, "Publisher", "");
            publisherNode.InnerText = publisher;
            ele1.AppendChild(publisherNode);

            XmlNode priceNode = doc.CreateNode(XmlNodeType.Element, "Price", "");
            priceNode.InnerText = price;
            ele1.AppendChild(priceNode);

            doc.DocumentElement.AppendChild(ele1);

            SaveDataToXMLFile(doc);
            LoadDataToGridView(LoadDataFromXMlFile());
        }
    }
}