<template>
    <footer class="footerlocal">
        <div class="footer-content">
            <div class="footerlogo">
                <svg fill="#fff" width="239" height="42" viewBox="0 0 239 42" xmlns="http://www.w3.org/2000/svg"><title>Condé Nast</title><path d="M16.935 31.161l3.095-5.04h.289v7.387h-.289l-2.839-1.544c-.831.677-2.872 1.854-5.105 1.854C6.382 33.818 0 29.735 0 22.594s6.505-11.225 11.99-11.225c2.234 0 4.083 1.148 4.816 1.764l2.874-1.453h.287v7.078h-.287l-3.125-4.793a6.373 6.373 0 0 0-4.565-1.912c-5.64 0-6.917 4.824-6.917 10.54 0 5.72 1.367 10.513 7.013 10.542 1.818-.062 3.67-.769 4.85-1.974zm9.288-8.566c0-6.836 6.348-11.225 11.708-11.225 5.354 0 11.702 4.39 11.702 11.225 0 6.831-6.348 11.223-11.702 11.223-5.36 0-11.708-4.392-11.708-11.223zm5.01 0c0 6.028 1.306 10.51 6.698 10.51 5.385 0 6.694-4.482 6.694-10.51 0-6.027-1.309-10.513-6.694-10.513-5.392 0-6.699 4.486-6.699 10.513zM69.85 11.773h6.346v.558h-2.66v21.487h-.271L57.28 12.362v20.496h2.683v.558H53.62v-.558h2.65V12.331h-2.65v-.558h8.99l9.919 14.084V12.331H69.85v-.558zm11.225-.002H91.12c4.817 0 13.24 1.822 13.24 10.696 0 8.873-8.423 10.945-13.24 10.945H81.075v-.557h2.867V12.329h-2.867v-.558zm7.4 21.084h2.458c5.804 0 8.484-4.144 8.484-10.263 0-6.121-2.68-10.263-8.484-10.263h-2.458v20.526zm27.245 0h8.454c1.947-2.07 3.768-6.706 3.768-6.706h.28v7.264h-19.9v-.558h2.867V12.328h-2.867v-.558h19.267v5.812h-.288s-1.82-3.863-4.018-5.254h-7.563v9.182h4.241c1.404-1.083 2.936-4.204 2.936-4.204h.291v8.967h-.29s-1.533-3.127-2.937-4.205h-4.24v10.787zm.55-27.104L123.43 0l-.322 2.718.577 1.533-7.318 1.658-.097-.158zm62.781 5.275h.298l10.269 21.827h2.681v.56h-10.493v-.56h2.902l-3.7-7.852-7.227.01-3.416 7.851 2.541-.009v.56h-6.03v-.56h2.607l9.568-21.827zm-1.755 5.905l-3.252 7.513h6.708l-3.456-7.513zm40.802-5.16h20.735v6.706h-.255s-2.012-4.083-3.956-6.148h-3.89v20.526h3.51v.557h-11.549v-.557h3.507V12.329h-3.89c-1.947 2.065-3.955 6.148-3.955 6.148h-.257V11.77zm-14.536 7.484l4.4 1.454c2.781.898 5.36 2.537 5.329 6.122 0 3.65-3.187 6.986-8.068 6.986-2.236 0-4.434-1.115-5.361-1.822l-2.873 1.514h-.287l-.158-7.48h.287l3.288 5.314c1.242 1.177 3.347 1.794 5.104 1.855 3.89-.031 5.356-2.162 5.356-4.111 0-2.285-1.625-3.276-3.986-4.113l-4.497-1.574c-2.521-.898-4.721-2.474-4.752-5.536.03-3.776 2.835-6.463 7.08-6.463 2.169 0 3.443.804 4.21 1.42l2.903-1.42h.257v6.865h-.257l-3.128-4.762c-1.145-1.08-2.167-1.483-3.985-1.483-2.936 0-4.85 1.297-4.85 3.43 0 2.041 1.787 3.092 3.988 3.804zm-45.023-7.482h6.346v.558h-2.66v21.487h-.274l-15.984-21.454v20.494h2.681v.558h-6.342v-.558h2.652V12.331h-2.652v-.558h8.993l9.917 14.08V12.332h-2.677v-.558z"></path></svg>
            </div>
            <ul>
                <li>关于我们</li>
                <li>联系我们</li>
                <li>隐私权政策</li>
                <li>版权声明</li>
                <li>投诉</li>
            </ul>
            <div class="copyright">
                版权所有 DiffuseWeiAvenger系列 <br> 京ICP备 16668888号-1
            </div>
        </div>
    </footer>
</template>

<script>
    export default {
        name: 'Header'
    }
</script>

<style>
.footerlocal {
    background-color: black;
    height: 385px;
}
.footerlogo{
    text-align: center;
}
.footer-content{
    padding-top: 200px;
}
.footer-content ul{
    margin-top: 15px;
    justify-content: center;
    display: flex;
    list-style-type: none;
}
.footer-content ul li{
    color: white;
    margin-left: 5px;
    margin-right: 5px;
    font-size: 14px;
}
.copyright{
    margin-top: 15px;
    color: white;
    font-size: 14px;
    text-align: center;
    padding-bottom: 20px;
}
</style>
