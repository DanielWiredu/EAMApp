<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="AggregateReports.aspx.cs" Inherits="EAMApp.Reports.AggregateReports" %>

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
                                 <telerik:RadComboBox ID="dlCurrency" runat="server" Width="100%" DataSourceID="currencySource" DataTextField="currency" DataValueField="currency" Filter="Contains" MarkFirstMatch="True" Text="Select Currency"></telerik:RadComboBox>
                            <asp:SqlDataSource ID="currencySource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT currency FROM [tblCurrency]"></asp:SqlDataSource>
                                   <asp:RequiredFieldValidator runat="server" ControlToValidate="dlCurrency" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Select Currency" ValidationGroup="detail"></asp:RequiredFieldValidator>

                              </div>
                                    <div class="col-md-3">
                                        <label>Year</label>
                                         <telerik:RadDropDownList ID="dlYear" runat="server" Width="100%"></telerik:RadDropDownList>
                                    </div>
                              
                              <div class="col-md-1">

                              </div>
                          </div>
                      </div>
                     <div class="modal-footer">
                    <asp:Button ID="btnReport" CssClass="btn btn-primary" runat="server" Text="Generate Report" OnClick="btnReport_Click" ValidationGroup="detail"/>         
                </div>



                        
                        <hr />
                        <div class="bg-primary">Select report parameters</div>
                        <div class="form-group">
                          <div class="row">
                              <div class="col-md-1">

                              </div>
                              <div class="col-md-4">
                                        <label>Summary Type</label>
                                         <telerik:RadDropDownList ID="dlSummaryType" runat="server" Width="100%">
                                             <Items>
                                                 <telerik:DropDownListItem Text="Aggregrate" />
                                                 <telerik:DropDownListItem Text="Per Member" />
                                             </Items>
                                         </telerik:RadDropDownList>
                                    </div>
                              <div class="col-md-3">
                                  <label>Currency</label>
                                 <telerik:RadComboBox ID="dlCurrency1" runat="server" Width="100%" DataSourceID="currencySource" DataTextField="currency" DataValueField="currency" Filter="Contains" MarkFirstMatch="True" Text="Select Currency"></telerik:RadComboBox>
                                   <asp:RequiredFieldValidator runat="server" ControlToValidate="dlCurrency1" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Select Currency" ValidationGroup="aggregate"></asp:RequiredFieldValidator>

                              </div>
                                    <div class="col-md-3">
                                        <label>Year(s)</label>
                                         <telerik:RadComboBox ID="dlYears" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" runat="server" Width="100%" Filter="None" MarkFirstMatch="false" Text="Select Year(s)"></telerik:RadComboBox>
                                    </div>
                              
                              <div class="col-md-1">

                              </div>
                          </div>
                      </div>
                        <div class="modal-footer">
                    <asp:Button ID="btnRunAggregate" CssClass="btn btn-primary" runat="server" Text="Generate Report" OnClick="btnRunAggregate_Click" ValidationGroup="aggregate"/>         
                </div>

                    </ContentTemplate>
                </asp:UpdatePanel>
                    </div>
                </div>
            </div>

                </div>
        </div>
</asp:Content>
