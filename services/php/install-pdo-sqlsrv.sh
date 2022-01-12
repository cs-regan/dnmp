curl -O https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/msodbcsql17_17.8.1.1-1_amd64.apk \
&& curl -O https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/mssql-tools_17.8.1.1-1_amd64.apk \
&& apk add --allow-untrusted msodbcsql17_17.8.1.1-1_amd64.apk \
&& apk add --allow-untrusted mssql-tools_17.8.1.1-1_amd64.apk \
&& apk add autoconf gcc g++ libc-dev make \
&& pecl install /www/pdo_sqlsrv-5.2.0.tgz