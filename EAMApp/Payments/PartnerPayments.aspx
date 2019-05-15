<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="PartnerPayments.aspx.cs" Inherits="EAMApp.Payments.PartnerPayments" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper wrapper-content animated fadeInRight">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Partner Payments</h5>
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
                         <label>MemberID</label>
                         <asp:TextBox ID="txtPartnerID" runat="server" Width="100%" Enabled="false"></asp:TextBox>
                     </div>
                     <div class="col-md-4">
                         <label>Name</label>
                         <asp:TextBox ID="txtFullname" runat="server" Width="100%" Enabled="false"></asp:TextBox>
                     </div>
                     <div class="col-md-2">
                         <label>Telephone</label>
                         <asp:TextBox ID="txtTelephone" runat="server" Width="100%" Enabled="false"></asp:TextBox>
                     </div>
                    <div class="col-md-3">
                         <label>Total </label>
                        <asp:TextBox ID="txtTotalAmt" runat="server" Width="100%" Enabled="false"></asp:TextBox>
                     </div>
                 </div>
             </div>
                        <asp:HiddenField runat="server" ID="hfEmail" />
                        <asp:HiddenField runat="server" ID="hfFirstname" />

                        <div class="row">
                                        <div class="col-sm-4 pull-right">
                                           
                                        </div>
                                        <div class="col-sm-8 pull-left">
                                            <div class="toolbar-btn-action">
                                                <asp:Button runat="server" ID="btnAddNew" CssClass="btn btn-success" Text="Add Payment" CausesValidation="false" OnClientClick="newModal()"/>  
                                                  <asp:LinkButton runat="server" PostBackUrl="~/Payments/Payments.aspx" Text="Back" CssClass="btn btn-warning"></asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>

                        <telerik:RadGrid ID="paymentGrid" runat="server" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True" DataSourceID="paymentSource" GroupPanelPosition="Top" OnItemCommand="paymentGrid_ItemCommand" OnItemDeleted="paymentGrid_ItemDeleted">
                            <ClientSettings>
                                <Selecting AllowRowSelect="True" />
                                <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                            </ClientSettings>
                            <MasterTableView AllowAutomaticDeletes="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="paymentSource" CommandItemDisplay="None" PageSize="12">
                                <CommandItemSettings AddNewRecordText="Add New Payment" />
                                <Columns>
                                    <telerik:GridBoundColumn DataField="id" DataType="System.Int32" FilterControlAltText="Filter id column" HeaderText="id" ReadOnly="True" SortExpression="id" UniqueName="id" Display="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridDateTimeColumn DataField="paydate" DataType="System.DateTime" FilterControlAltText="Filter paydate column" HeaderText="Date" SortExpression="paydate" UniqueName="paydate" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="100px" DataFormatString="{0:dd-MMM-yyyy}">
                                    <HeaderStyle Width="130px" />
                                    </telerik:GridDateTimeColumn>
                                    <telerik:GridBoundColumn DataField="paymsg" FilterControlAltText="Filter paymsg column" HeaderText="Description" SortExpression="paymsg" UniqueName="paymsg" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="120px">
                                    <HeaderStyle Width="150px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="currency" FilterControlAltText="Filter currency column" HeaderText="Currency" SortExpression="currency" UniqueName="currency" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="80px">
                                    <HeaderStyle Width="100px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="amount" DataType="System.Decimal" FilterControlAltText="Filter amount column" HeaderText="Amount" SortExpression="amount" UniqueName="amount" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="80px" DataFormatString="{0:N02}">
                                    <HeaderStyle Width="100px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="paymode" FilterControlAltText="Filter paymode column" HeaderText="Mode" SortExpression="paymode" UniqueName="paymode" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="80px">
                                    <HeaderStyle Width="100px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="reference" FilterControlAltText="Filter reference column" HeaderText="Reference" SortExpression="reference" UniqueName="reference" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="120px">
                                    <HeaderStyle Width="150px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridButtonColumn ButtonType="PushButton" CommandName="Edit" ButtonCssClass="btn-info" Text="Edit">
                                        <HeaderStyle Width="50px" />
                                    </telerik:GridButtonColumn>
                                    <telerik:GridButtonColumn Text="Delete" CommandName="Delete" UniqueName="Delete" ConfirmText="Delete Record?" ButtonType="PushButton" ButtonCssClass="btn-danger">
                                        <HeaderStyle Width="60px" />
                                    </telerik:GridButtonColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                        <asp:SqlDataSource ID="paymentSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [tblPayments] WHERE [id] = @id" SelectCommand="SELECT id, paydate, paymsg, amount, currency, paymode, reference FROM tblPayments WHERE (partnerid = @partnerid) ORDER BY paydate">
                            <DeleteParameters>
                                <asp:Parameter Name="id" Type="Int32" />
                            </DeleteParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtPartnerID" DefaultValue=" " Name="partnerid" PropertyName="Text" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </ContentTemplate>
                </asp:UpdatePanel>
                    </div>
                </div>
        </div>

     <!-- new tithe modal -->
         <div class="modal fade" id="newmodal">
    <div class="modal-dialog" style="width:50%">
        <asp:UpdatePanel runat="server" ID="upNewPayment">
            <ContentTemplate>
                 <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">New Payment</h4>
                </div>
                        <div class="modal-body">
                            <asp:UpdateProgress runat="server" AssociatedUpdatePanelID="upNewPayment">
                                <ProgressTemplate>
                                    Sending....
                                    <img alt="" src="/Content/img/loader.gif" />
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                             <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-4">
                                                <label>Payment Date</label>
                                       <telerik:RadDatePicker runat="server" ID="dpPaydate" Width="100%"></telerik:RadDatePicker>
                                   <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="dpPaydate" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="new"></asp:RequiredFieldValidator>
                                        </div>
                                         <div class="col-md-4">
                                        <label>Month</label>
                                          <telerik:RadDropDownList ID="dlMonth" runat="server" Width="100%">
                                            <Items>
                                                <telerik:DropDownListItem Text="January" Value="1"/>
                                                <telerik:DropDownListItem Text="February" Value="2"/>
                                                <telerik:DropDownListItem Text="March" Value="3"/>
                                                <telerik:DropDownListItem Text="April" Value="4"/>
                                                <telerik:DropDownListItem Text="May" Value="5"/>
                                                <telerik:DropDownListItem Text="June" Value="6"/>
                                                <telerik:DropDownListItem Text="July" Value="7"/>
                                                <telerik:DropDownListItem Text="August" Value="8"/>
                                                <telerik:DropDownListItem Text="September" Value="9"/>
                                                <telerik:DropDownListItem Text="October" Value="10"/>
                                                <telerik:DropDownListItem Text="November" Value="11"/>
                                                <telerik:DropDownListItem Text="December" Value="12"/>
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                    <div class="col-md-4">
                                        <label>Year</label>
                                         <telerik:RadDropDownList ID="dlYear" runat="server" Width="100%"></telerik:RadDropDownList>
                                    </div>
                               
                                    </div>
                             </div>

                              <div class="form-group">
                               <div class="row">
                                   <div class="col-md-4">
                                    <label>Currency</label>
                                    <telerik:RadDropDownList ID="dlCurrency" runat="server" Width="100%" DataSourceID="currencySource" DataTextField="Currency" DataValueField="Currency"></telerik:RadDropDownList>
                                     <asp:SqlDataSource ID="currencySource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Currency] FROM [tblCurrency]"></asp:SqlDataSource>
                                </div>
                                   <div class="col-md-8">
                                       <label>Amount </label>
                                <telerik:RadNumericTextBox runat="server" ID="txtAmount" MinValue="0" Width="100%" Value="0"></telerik:RadNumericTextBox>
                                <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="txtAmount" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="new"></asp:RequiredFieldValidator>
                                   </div>
                               </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-4">
                                        <label>Paymode</label>
                                        <telerik:RadDropDownList ID="dlPaymode" runat="server" Width="100%" DataSourceID="paymodeSource" DataTextField="paymode" DataValueField="paymode"></telerik:RadDropDownList>
                                        <asp:SqlDataSource ID="paymodeSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT paymode FROM [tblPayMode]"> </asp:SqlDataSource>
                                    </div>
                                      <div class="col-md-8">
                                        <label>Reference</label>
                                         <asp:TextBox runat="server" ID="txtReference" Width="100%"></asp:TextBox>
                                    </div>
                                    <%--<div class="col-md-4">
                                           <label>Value Date</label>
                                       <telerik:RadDatePicker runat="server" ID="dpValueDate" Width="100%" Enabled="false"></telerik:RadDatePicker>
                                   <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="dpValueDate" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="new"></asp:RequiredFieldValidator>
                                        </div>--%>
                                </div>
                            </div>

                       </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" ValidationGroup="new" OnClick="btnSave_Click" />
                </div>
            </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        </div>
         </div>

    <!-- edit tithe modal -->
         <div class="modal fade" id="editmodal">
    <div class="modal-dialog" style="width:50%">
        <asp:UpdatePanel runat="server" ID="upEditPayment">
            <ContentTemplate>
                 <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">Edit Payment</h4>
                </div>
                          <div class="modal-body">
                              <asp:UpdateProgress runat="server" AssociatedUpdatePanelID="upEditPayment">
                                <ProgressTemplate>
                                    Sending....
                                    <img alt="" src="/Content/img/loader.gif" />
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                             <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-4">
                                                <label>Payment Date</label>
                                       <telerik:RadDatePicker runat="server" ID="dpPaydate1" Width="100%"></telerik:RadDatePicker>
                                   <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="dpPaydate1" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="edit"></asp:RequiredFieldValidator>
                                        </div>
                                         <div class="col-md-4">
                                        <label>Month</label>
                                          <telerik:RadDropDownList ID="dlMonth1" runat="server" Width="100%">
                                            <Items>
                                                <telerik:DropDownListItem Text="January" Value="1"/>
                                                <telerik:DropDownListItem Text="February" Value="2"/>
                                                <telerik:DropDownListItem Text="March" Value="3"/>
                                                <telerik:DropDownListItem Text="April" Value="4"/>
                                                <telerik:DropDownListItem Text="May" Value="5"/>
                                                <telerik:DropDownListItem Text="June" Value="6"/>
                                                <telerik:DropDownListItem Text="July" Value="7"/>
                                                <telerik:DropDownListItem Text="August" Value="8"/>
                                                <telerik:DropDownListItem Text="September" Value="9"/>
                                                <telerik:DropDownListItem Text="October" Value="10"/>
                                                <telerik:DropDownListItem Text="November" Value="11"/>
                                                <telerik:DropDownListItem Text="December" Value="12"/>
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                    <div class="col-md-4">
                                        <label>Year</label>
                                         <telerik:RadDropDownList ID="dlYear1" runat="server" Width="100%"></telerik:RadDropDownList>
                                    </div>
                               
                                    </div>
                             </div>
                             <div class="form-group">
                               <div class="row">
                                   <div class="col-md-4">
                                    <label>Currency</label>
                                    <telerik:RadDropDownList ID="dlCurrency1" runat="server" Width="100%" DataSourceID="currencySource" DataTextField="Currency" DataValueField="Currency"></telerik:RadDropDownList>
                                </div>
                                   <div class="col-md-8">
                                       <label>Amount </label>
                                <telerik:RadNumericTextBox runat="server" ID="txtAmount1" MinValue="0" Width="100%"></telerik:RadNumericTextBox>
                                <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="txtAmount1" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="edit"></asp:RequiredFieldValidator>
                                   </div>
                               </div>
                            </div>

                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-4">
                                        <label>Payment Mode</label>
                                        <telerik:RadDropDownList runat="server" ID="dlPaymode1" Width="100%" DataSourceID="paymodeSource" DataTextField="paymode" DataValueField="paymode"></telerik:RadDropDownList>
                                    </div>
                                      <div class="col-md-8">
                                        <label>Reference</label>
                                         <asp:TextBox runat="server" ID="txtReference1" Width="100%"></asp:TextBox>
                                    </div>
                                    <%--<div class="col-md-4">
                                           <label>Value Date</label>
                                       <telerik:RadDatePicker runat="server" ID="dpValueDate1" Width="100%" Enabled="false"></telerik:RadDatePicker>
                                   <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="dpValueDate1" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="edit"></asp:RequiredFieldValidator>
                                        </div>--%>
                                </div>
                            </div>

                       </div>


                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-primary" ValidationGroup="edit" OnClick="btnUpdate_Click"/>
                </div>
            </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        </div>
         </div>

        <script type="text/javascript">
            function newModal() {
                $('#newmodal').modal('show');
                $('#newmodal').appendTo($("form:first"));
            }
            function closenewModal() {
                $('#newmodal').modal('hide');
            }
            function editModal() {
                $('#editmodal').modal('show');
                $('#editmodal').appendTo($("form:first"));
            }
            function closeeditModal() {
                $('#editmodal').modal('hide');
            }
    </script>
</asp:Content>
