<style>
    body {
        background: linear-gradient(to bottom right, #99ccff 0%, #ff8080 100%);    }
    form {
        width: 200px;
        float: left;
        margin-top: 5px;
        margin-left: 10px;
    }
    .form{
        width: 175px;
    }
    hr{
        height:  3px;
        text-align:left;
        margin-left:0;
        background-color:  #ff3333;
    }
    .mid{
        height: 1px;
        width: 30%;
    }
    p{
        clear: both;
    }
    textarea {
        resize: none;
    }
    h5,h6{
        text-align: left;
    }
    h6{
        font-size: x-small;
    }
    .menu{
        clear: both;
        margin-left: 7px;
        margin-top: 7px;
        margin-right: 7px;
    }
    .afloatright {
        float: right;
        margin-left: 5px;
        margin-right: 10px;
    }
    .div{
        display: inline-block;
        vertical-align: top;
        padding: 1rem;
    }
    .column-form{
        margin-left: 35px;
        width: 30%;
    }
    .column-list{
        margin-top: -5em;
        width: 65%;
        height: 300px;
    }
    .bb {
        position: relative;
        top: 100%;
        left: 50%;
        text-align: center;
        transform: translate(-50%, -50%);
    }
    .cont
    {
        height:400px;
        overflow:auto;
    }
    .ainer{
        margin-top: 90px;
    }
</style>
    <c:if test="${user==null}">
        <a class="afloatright" href="/register"> Register</a>
        <a class="afloatright" href="/login">Login</a>
    </c:if>
    <c:if test="${user!=null}">
        <a class="afloatright" href="/logout">Logout</a>
        <a class="afloatright" href="/panel/project">Hello ${user}</a>
    </c:if>
<br>