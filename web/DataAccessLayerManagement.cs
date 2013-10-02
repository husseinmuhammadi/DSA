using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Conference.DAL
{

    /// <summary>
    /// Summary description for CustomException
    /// </summary>
    public class FileUploadException : System.Exception
    {
        public FileUploadException()
        {
        }
        public FileUploadException(string message)
            : base(message)
        {
        }
        public FileUploadException(string message, System.Exception inner)
            : base(message, inner)
        {
        }
    }


    /// <summary>
    /// Summary description for CustomException
    /// </summary>
    public class CustomException : System.Exception
    {
        public CustomException()
        {
        }
        public CustomException(string message)
            : base(message)
        {
        }
        public CustomException(string message, System.Exception inner)
            : base(message, inner)
        {
        }
    }


    /// <summary>
    /// Summary description for CustomException
    /// </summary>
    public class InvalidImageArgumentException : System.ArgumentException
    {
        public InvalidImageArgumentException()
        {
        }
        public InvalidImageArgumentException(string message)
            : base(message)
        {
        }
        public InvalidImageArgumentException(string message, System.Exception inner)
            : base(message, inner)
        {
        }
    }


    /// <summary>
    /// Summary description for DataAccessLayer
    /// </summary>
    public class DataAccessLayerManagement
    {
        public DataAccessLayerManagement()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public static int UploadImage(System.Web.HttpPostedFile ImageFile, string strServerImagesDirectoryName)
        {
            if (ImageFile == null)
                throw new FileUploadException("File upload appear to be null!");

            if (ImageFile.FileName == null)
                throw new FileUploadException("File name apear to be null!");

            // FileName -> Only File Name
            // DirectoryName -> Only Directory Name
            // Path -> DirectoryName + FileName

            string strImageFileName = System.IO.Path.GetFileName(ImageFile.FileName);

            string strServerImagePath = strServerImagesDirectoryName + "\\" + strImageFileName;

            if (System.IO.File.Exists(strServerImagePath))
            {
                strImageFileName = System.IO.Path.GetRandomFileName();
                strImageFileName = System.IO.Path.GetFileNameWithoutExtension(strImageFileName);
                strImageFileName += System.IO.Path.GetExtension(strServerImagePath);
                strServerImagePath = strServerImagesDirectoryName + "\\" + strImageFileName;
            }

            //if (!System.IO.Directory.Exists(strPath))
            //{
            //    System.IO.Directory.CreateDirectory(strPath);
            //}

            //if (System.IO.Path.GetExtension(strServerImagePath).ToUpper() != ".JPG" &&
            //    System.IO.Path.GetExtension(strServerImagePath).ToUpper() != ".JPEG")
            //    throw new CustomException();

            //if (ImageFile.ContentType.ToUpper() != "IMAGE/JPEG" /*Firefox*/ &&
            //    ImageFile.ContentType.ToUpper() != "IMAGE/PJPEG" /*Internet Explorer*/)
            //    throw new CustomException();

            if (ImageFile.ContentLength == 0)
                throw new CustomException();


            ConferenceDataSet.ImagesDataTable Images = new ConferenceDataSet.ImagesDataTable();
            ConferenceDataSet.ImagesRow Image = Images.NewImagesRow();

            Image.ClientFileName = ImageFile.FileName;
            Image.FileExtension = System.IO.Path.GetExtension(ImageFile.FileName);
            Image.ContentType = ImageFile.ContentType;
            Image.ContentLength = ImageFile.ContentLength;
            Image.ServerFileName = strImageFileName;

            //if (pfCoverImage.ContentLength > 200 * 1024)
            //{
            //    lblMessage.Visible = true;
            //    lblMessage.ForeColor = System.Drawing.Color.Red;
            //    lblMessage.Text = "Your Picture File Size Must Be Less Than 20 KB.";
            //}
            //else
            //{
            //    System.Drawing.Image img = System.Drawing.Image.FromStream(pfCoverImage.InputStream);
            //    if (img.Width > 1200 || img.Height > 1200)
            //    {
            //        lblMessage.Visible = true;
            //        lblMessage.ForeColor = System.Drawing.Color.Red;
            //        lblMessage.Text = "Your Picture Width & Height Must Be Less Than 120 px.";
            //    }
            //    else
            //    {
            //System.IO.Path.GetTempFileName

            try
            {
                System.Drawing.Image imgCoverImage = System.Drawing.Image.FromStream(ImageFile.InputStream);
                string strMimeType = Conference.GeneralPorpose.GetMimeType(imgCoverImage);
                Image.ContentTypeByCode = strMimeType;
                Image.ImageFormat = imgCoverImage.RawFormat.Guid;
            }
            catch (System.ArgumentException eArgumentException)
            {
                throw new InvalidImageArgumentException(eArgumentException.Message + " Invalid image type!");
            }

            try
            {
                ImageFile.SaveAs(strServerImagePath);
            }
            catch (System.IO.DirectoryNotFoundException eDirectoryNotFound)
            {
            }
            catch (System.UnauthorizedAccessException eUnauthorizedAccess)
            {
            }

            Images.Rows.Add(Image);
            ConferenceDataSetTableAdapters.ImagesTableAdapter ImagesTableAdapter = new ConferenceDataSetTableAdapters.ImagesTableAdapter();
            ImagesTableAdapter.Update(Images);

            return Image.ImageID;
        }

        public static int UploadFile(System.Web.HttpPostedFile uploadFile, int iDocumentID)
        {
            if (uploadFile == null)
                throw new FileUploadException("File upload appear to be null!");

            ConferenceDataSet.FilesDataTable dtFile = new ConferenceDataSet.FilesDataTable();
            ConferenceDataSet.FilesRow drFiles = dtFile.NewFilesRow();

            drFiles.Content = new byte[uploadFile.ContentLength];
            System.IO.Stream stream = uploadFile.InputStream;
            stream.Read(drFiles.Content, 0, drFiles.Content.Length);

            drFiles.ClientFileName = uploadFile.FileName;
            drFiles.FileExtension = System.IO.Path.GetExtension(uploadFile.FileName);
            drFiles.ContentType = uploadFile.ContentType;
            drFiles.ContentLength = uploadFile.ContentLength;

			if (iDocumentID != 0)
				drFiles.DocumentIDRef = iDocumentID;

            dtFile.Rows.Add(drFiles);

            ConferenceDataSetTableAdapters.FilesTableAdapter adptFiles = new ConferenceDataSetTableAdapters.FilesTableAdapter();

            adptFiles.Update(dtFile);

            return drFiles.FileID;
        }

		internal static void UpdateDocument(int iDocumentID, StatusEnum status)
		{
			
		}
	}
}