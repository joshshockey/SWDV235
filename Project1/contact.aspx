<%@ Page Language="C#" %><%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>
<script runat="server">
    protected void submitButton_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            // Code that uses the data entered by the user
            // Define data objects
            SqlConnection conn;
            SqlCommand comm;
            // Read the connection string from Web.config
            string connectionString =
                ConfigurationManager.ConnectionStrings[
                "thproject"].ConnectionString;
            // Initialize connection
            conn = new SqlConnection(connectionString);
            // Create command 
            comm = new SqlCommand("EXEC InsertVisitor @nameTextBox,@emailTextBox, @msgTextBox", conn);
            comm.Parameters.Add("@nameTextBox", System.Data.SqlDbType.NChar, 50);
            comm.Parameters["@nameTextBox"].Value = name.Text;
            comm.Parameters.Add("@emailTextBox", System.Data.SqlDbType.NChar, 50);
            comm.Parameters["@emailTextBox"].Value = email.Text;
            comm.Parameters.Add("@msgTextBox", System.Data.SqlDbType.NChar, 200);
            comm.Parameters["@msgTextBox"].Value = message.Text;

            // Enclose database code in Try-Catch-Finally
            try
            {
                // Open the connection
                conn.Open();
                // Execute the command
                comm.ExecuteNonQuery();
                // Reload page if the query executed successfully
                Response.Redirect("join.html");
            }
            catch (SqlException ex)
            {
                // Display error message
                dbErrorMessage.Text =
                   "Error submitting the data!" + ex.Message.ToString();

            }
            finally
            {
                // Close the connection
                conn.Close();
            }
        }
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head runat="server">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>       
    <link href="css/bootstrap.min.css" rel="stylesheet"/>  
	<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <link href="css/style.css" rel="stylesheet"/>    
    <link href="SpryAssets/SpryMenuBarHorizontal.css" rel="stylesheet" type="text/css"/>
    <link href="SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css"/>
    <link href="SpryAssets/SpryValidationTextarea.css" rel="stylesheet" type="text/css"/> 
    <script src="SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
    <script src="SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
    <script src="SpryAssets/SpryValidationTextarea.js" type="text/javascript"></script>
    <script src="js/email_list.js"></script>
	
	<title>Throat Honey Band Page</title>             
    
  </head>

  <body>

    <div class="site-wrapper">

      <div class="site-wrapper-inner">

        <div class="cover-container">

        <div class="masthead clearfix">
            <div class="inner">              
              <nav class="navbar navbar-inverse navbar-fixed-top">
				<div class="container-fluid">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span> 
							</button>
						<a class="navbar-brand" href="index.html">Throat Honey - Boise Skate Punk</a>
						</div>
						<div class="collapse navbar-collapse" id="myNavbar">
							<ul class="nav navbar-nav navbar-right">
								<li class="active"><a href="index.html">Home</a></li>
								<li><a href="info.html">Calculate</a></li> 
								<li><a href="newsletter.aspx">News</a></li>
								<li><a href="contact.aspx">Contact</a></li>
								<li><a href="faq.html">FAQ</a></li>
                            </ul>
						</div>
				</div>
			  </nav>
            </div> 
          </div>
		</div>
		<div class="inner cover">
			<h1 class="cover-heading">Contact us for more info or to book a show!</h1>
			<main>
            <%--Form code ammended to support asp --%>
			<form name="form1" runat="server">
                <span id ="emailTextField">
			        <label for="email">Email Address:</label>			       
                   <asp:TextBox ID="email" runat="server" /><br /></span>                  
			        <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span>        
                
                <span id ="nameTextField">
			         <label for="name">Name</label>			      
			        <asp:TextBox ID="name" runat="server" /></span><br />
                     <span class="textfieldRequiredMsg">A value is required.</span>
			
                <span id="messageTextArea">
                    <label for="message">Comments:</label>			       
                    <asp:TextBox ID="message" runat="server" Height="100px" Width="200px" /></span><br />                
			        <span id="countmessageTextArea">&nbsp;</span><span class="textareaRequiredMsg">A value is required.</span><span class="textareaMinCharsMsg">Minimum number of characters not met.</span><span class="textareaMaxCharsMsg">Exceeded maximum number of characters.</span>
			
                <p>
                    <asp:Button ID="submitButton" runat="server"
                        Text="Submit" onclick="submitButton_Click" />
                <br />
                    <asp:Label ID="dbErrorMessage" runat="server"></asp:Label>

                </p>
			</form>
			</main>
		</div>				
		
		<div class="footer">
			<div class="inner">
				<script src="js/date.js"></script>
			</div>
		</div>	 				   	
	  </div>
	</div>		
	<!-- Bootstrap -->	
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgDown:"SpryAssets/SpryMenuBarDownHover.gif", imgRight:"SpryAssets/SpryMenuBarRightHover.gif"});
var sprytextfield1 = new Spry.Widget.ValidationTextField("nameTextField", "none", {hint:"Your Name", validateOn:["blur"]});
var sprytextfield2 = new Spry.Widget.ValidationTextField("emailTextField", "email", {hint:"Your Email", validateOn:["blur"]});
var sprytextarea1 = new Spry.Widget.ValidationTextarea("messageTextArea", {minChars:1, maxChars:500, counterType:"chars_remaining", counterId:"countmessageTextArea", validateOn:["blur"], hint:"Your Message"});
</script>
</body>
</html>
	  