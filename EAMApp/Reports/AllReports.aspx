<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="AllReports.aspx.cs" Inherits="EAMApp.Reports.AllReports" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                       <p>Financial Reports</p>
                        
                         <asp:UpdatePanel runat="server" >
                    <ContentTemplate>
                          <div class="bg-primary">Select duration for Report</div>
             
                       <div class="form-group">
                          <div class="row">
                              <div class="col-md-1">

                              </div>
                              <div class="col-md-4">
                                  <label>Currency</label>
                                 <telerik:RadComboBox ID="dlCurrency" runat="server" Width="100%" DataSourceID="currencySource" DataTextField="cur_code" DataValueField="cur_code" Filter="Contains" MarkFirstMatch="True" Text="Select Currency"></telerik:RadComboBox>
                            <asp:SqlDataSource ID="currencySource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT currency FROM [tblCurrency]"></asp:SqlDataSource>
                                   <asp:RequiredFieldValidator runat="server" ControlToValidate="dlCurrency" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Select Currency" ValidationGroup="detail"></asp:RequiredFieldValidator>

                              </div>
                              <div class="col-md-3">
                                  <label>Start Date</label>
                                  <telerik:RadDatePicker ID="dpSdate" runat="server" Width="100%" DateInput-ReadOnly="true"></telerik:RadDatePicker>
                                  <asp:RequiredFieldValidator runat="server" ControlToValidate="dpSdate" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Start date required" ValidationGroup="detail"></asp:RequiredFieldValidator>
                              </div>
                                <div class="col-md-3">
                                  <label>End Date</label>
                                  <telerik:RadDatePicker ID="dpEdate" runat="server" Width="100%" DateInput-ReadOnly="true"></telerik:RadDatePicker>
                                  <asp:RequiredFieldValidator runat="server" ControlToValidate="dpEdate" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ErrorMessage="End date required" ValidationGroup="detail"></asp:RequiredFieldValidator>
                              </div>
                              
                              <div class="col-md-1">

                              </div>
                          </div>
                      </div>

                     <div class="modal-footer">
                    <asp:Button ID="btnReport" CssClass="btn btn-primary" runat="server" Text="Generate Report" ValidationGroup="detail"/>         
                </div>

                    </ContentTemplate>
                </asp:UpdatePanel>
                    </div>
                </div>
            </div>

                </div>
        </div>
</asp:Content>
