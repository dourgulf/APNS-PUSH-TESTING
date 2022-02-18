# APNS-PUSH-TESTING
APNS push testing command line tools

## Usage
- Replace file `apns.p12` with your APNS certificate with the one you generated;
- If your p12 file exported with password, remove it first with script `apns-p12-remove-password.sh`;
```Shell
apns-p12-remove-password.sh apns.p12
mv apns.p12 protected-apns.p12
mv unprotected.p12 apns.p12
```
Note: When running script, you will prompt enter the password, this is the password of you p12,
And next time prompt you enter password, you should not enter anything, just press enter twice.

- Execute script `apns-push.sh` to push your message to APNS;
- You can change the push message by modify the file `apns-push.sh`;

## 使用方法
- 替换文件 `apns.p12` 为你生成的 APNS 证书;
- 如果你的 p12 文件导出了密码, 那么第一步需要执行脚本 `apns-p12-remove-password.sh`;
```Shell
apns-p12-remove-password.sh apns.p12
mv apns.p12 protected-apns.p12
mv unprotected.p12 apns.p12
```
- 执行脚本 `apns-push.sh` 来推送消息到 APNS;
- 你可以通过修改文件 `apns-push.sh` 来修改推送的消息;