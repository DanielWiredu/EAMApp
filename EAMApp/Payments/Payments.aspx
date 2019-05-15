<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Payments.aspx.cs" Inherits="EAMApp.Payments.Payments" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper wrapper-content animated fadeInRight">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Covenant Partners</h5>
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
                          <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                                        <div class="row">
                                        <div class="col-sm-4 pull-right">
                                           <asp:TextBox runat="server" ID="txtSearch" Width="100%" placeholder="Partner ID / Fullname..." OnTextChanged="txtSearch_TextChanged" AutoPostBack="true"></asp:TextBox>
                                       </div>
                                        <div class="col-sm-8 pull-left">
                                            <div class="toolbar-btn-action">
                                                <%--<asp:Button runat="server" ID="btnAdd" CssClass="btn-primary" Text="Add New" CausesValidation="false" OnClick="btnAdd_Click"/>--%>  
                                            </div>
                                        </div>
                                    </div>
                        <hr />

                        <telerik:RadGrid ID="partnersGrid" runat="server" AllowSorting="True" DataSourceID="partnerSource" GroupPanelPosition="Top" OnItemCommand="partnersGrid_ItemCommand">
                             <ClientSettings>
                                <Selecting AllowRowSelect="True" />
                                <Scrolling AllowScroll="true" ScrollHeight="400px" UseStaticHeaders="true" />
                            </ClientSettings>
                            <GroupingSettings CaseSensitive="false" />
                            <MasterTableView AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="partnerSource" PageSize="50">
                                <Columns>
                                    <telerik:GridBoundColumn DataField="PartnerId" FilterControlAltText="Filter PartnerId column" HeaderText="PartnerId" SortExpression="PartnerId" UniqueName="PartnerId">
                                    <HeaderStyle Width="120px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Title" FilterControlAltText="Filter Title column" HeaderText="Title" SortExpression="Title" UniqueName="Title">
                                    <HeaderStyle Width="80px" />
                                    </telerik:GridBoundColumn>
                                    <%--<telerik:GridBoundColumn DataField="Fullname" FilterControlAltText="Filter Fullname column" HeaderText="Fullname" SortExpression="Fullname" UniqueName="Fullname">
                                    <HeaderStyle Width="250px" />
                                    </telerik:GridBoundColumn>--%>
                                    <telerik:GridBoundColumn DataField="Firstname" FilterControlAltText="Filter Firstname column" HeaderText="Firstname" SortExpression="Firstname" UniqueName="Firstname">
                                    <HeaderStyle Width="150px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Lastname" FilterControlAltText="Filter Lastname column" HeaderText="Lastname" SortExpression="Lastname" UniqueName="Lastname">
                                    <HeaderStyle Width="150px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Telephone1" FilterControlAltText="Filter Telephone1 column" HeaderText="Telephone1" SortExpression="Telephone1" UniqueName="Telephone1">
                                    <HeaderStyle Width="120px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Email" FilterControlAltText="Filter Email column" HeaderText="Email" SortExpression="Email" UniqueName="Email">
                                    <HeaderStyle Width="200px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="DateRegistered" DataType="System.DateTime" FilterControlAltText="Filter DateRegistered column" HeaderText="DateRegistered" SortExpression="DateRegistered" UniqueName="DateRegistered" DataFormatString="{0:dd-MMM-yyyy}">
                                    <HeaderStyle Width="140px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridButtonColumn ButtonType="PushButton" CommandName="Select" ButtonCssClass="btn-info" Text="Select">
                                        <HeaderStyle Width="60px" />
                                    </telerik:GridButtonColumn>

                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>

                                        <asp:SqlDataSource ID="partnerSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT top(50) [ID], [PartnerId], [Title], [Firstname], [Lastname], [Telephone1], [Email], [ProposedAmt], [DateRegistered] FROM [vwCovenantPartners] WHERE (([PartnerId] LIKE '%' + @PartnerId + '%') OR ([Fullname] LIKE '%' + @Fullname + '%')) ORDER BY ID">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="txtSearch" Name="PartnerId" PropertyName="Text" Type="String" ConvertEmptyStringToNull="false" />
                                                <asp:ControlParameter ControlID="txtSearch" Name="Fullname" PropertyName="Text" Type="String" ConvertEmptyStringToNull="false" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>

                    </ContentTemplate>
                    <Triggers>
                                  <%--<asp:PostBackTrigger ControlID="btnExcelExport" />--%>
                              </Triggers>
                </asp:UpdatePanel>
                    </div>
                </div>
        </div>

</asp:Content>
