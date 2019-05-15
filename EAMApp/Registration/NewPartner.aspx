<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="NewPartner.aspx.cs" Inherits="EAMApp.Registration.NewPartner" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper wrapper-content animated fadeInRight">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>New Partner</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                         <asp:UpdatePanel runat="server" >
                    <ContentTemplate>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-3">
                                        <label>Partner ID</label>
                                         <asp:TextBox runat="server" ID="txtPartnerID" Width="100%" Enabled="false"></asp:TextBox>
                                    </div>
                                <div class="col-md-3">
                                        <label>Lastname</label>
                                         <asp:TextBox runat="server" ID="txtLastname" Width="100%"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="txtLastname" Display="Dynamic" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </div>
                                <div class="col-md-3">
                                        <label>Firstname</label>
                                         <asp:TextBox runat="server" ID="txtFirstname" Width="100%"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="txtFirstname" Display="Dynamic" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </div>
                                <div class="col-md-3">
                                        <label>Title</label>
                                        <telerik:RadDropDownList runat="server" ID="dlTitle" Width="100%" DefaultMessage="Select Description" DataSourceID="titleSource" DataTextField="title" DataValueField="title" DropDownHeight="200px"></telerik:RadDropDownList>
                                        <asp:SqlDataSource ID="titleSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT title FROM [tblTitle]"> </asp:SqlDataSource>
                                    </div>
                            </div>
                        </div>
                        <div class="form-group">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>City</label>
                                        <asp:TextBox runat="server" ID="txtCity" Width="100%"></asp:TextBox>
                                    </div>
                                    <div class="col-md-3">
                                        <label>Telephone 1</label>
                                        <asp:TextBox runat="server" ID="txtTelephone1" Width="100%" TextMode="Number"></asp:TextBox>
                                    </div>
                                    <div class="col-md-3">
                                        <label>Telephone 2</label>
                                        <asp:TextBox runat="server" ID="txtTelephone2" Width="100%" TextMode="Number"></asp:TextBox>
                                    </div>
                                 
                                </div>
                            </div>
                        <div class="form-group">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Email</label>
                                        <asp:TextBox runat="server" ID="txtEmail" Width="100%" TextMode="Email"></asp:TextBox>
                                    </div>
                                    <div class="col-md-3">
                                        <label>Profession</label>
                                        <telerik:RadDropDownList runat="server" ID="dlProfession" Width="100%" DefaultMessage="Select Profession" DataSourceID="professionSource" DataTextField="profession" DataValueField="profession" DropDownHeight="200px"></telerik:RadDropDownList>
                                        <asp:SqlDataSource ID="professionSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT profession FROM [tblProfession]"> </asp:SqlDataSource>
                                    </div>
                                    <div class="col-md-3">
                                        <label>Payment Frequency</label>
                                        <telerik:RadDropDownList runat="server" ID="dlPayFreq" Width="100%" DefaultMessage="Select Payment Frequency" DataSourceID="payfreqSource" DataTextField="payfreq" DataValueField="payfreq"></telerik:RadDropDownList>
                                        <asp:SqlDataSource ID="payfreqSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT payfreq FROM [tblPayFreq]"> </asp:SqlDataSource>
                                    </div>
                                </div>
                            </div>
                             <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-3">
                                        <label>Payment Mode</label>
                                        <telerik:RadDropDownList runat="server" ID="dlPaymode" Width="100%" DefaultMessage="Select Payment Mode" DataSourceID="paymodeSource" DataTextField="paymode" DataValueField="paymode"></telerik:RadDropDownList>
                                        <asp:SqlDataSource ID="paymodeSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT paymode FROM [tblPayMode]"> </asp:SqlDataSource>
                                    </div>
                                           <div class="col-md-3">
                                                <label>Registration Date</label>
                                       <telerik:RadDatePicker runat="server" ID="dpRegdate" Width="100%" DateInput-ReadOnly="true"></telerik:RadDatePicker>
                                   <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="dpRegdate" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ></asp:RequiredFieldValidator>
                                        </div>
                                 <div class="col-md-3">
                               <label>Proposed Amount</label>
                                <telerik:RadNumericTextBox runat="server" ID="txtProposedAmount" MinValue="0" ShowSpinButtons="true" Width="100%" Value="0"></telerik:RadNumericTextBox>
                                <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="txtProposedAmount" Display="Dynamic" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </div>
                                        <div class="col-md-3">
                                    <label>Currency</label>
                                    <telerik:RadDropDownList ID="dlCurrency" runat="server" Width="100%" DataSourceID="currencySource" DataTextField="Currency" DataValueField="Currency"></telerik:RadDropDownList>
                                     <asp:SqlDataSource ID="currencySource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Currency] FROM [tblCurrency]"></asp:SqlDataSource>
                                </div>
                                      
                                    </div>
                             </div>

                        <div class="modal-footer">
                    <asp:Button ID="btnReturn" runat="server" Text="Return" CssClass="btn btn-warning" CausesValidation="false" style="margin-bottom:0px" PostBackUrl="~/Registration/Partners.aspx"  />
                     <asp:Button runat="server"  CssClass="btn btn-success" ID="btnClear" Text="Add New" CausesValidation="false" OnClick="btnClear_Click"/>
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btnSave_Click"  />
                </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                    </div>
                </div>
        </div>
</asp:Content>
