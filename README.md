# APNS-PUSH-TESTING
APNS push testing command line tools

## Use p12 certificate
通过p12证书方式进行推送
### Usage
- Use apns-push-p12.sh shell script;
- Replace variable `P12_FILE` with your exported p12 certificate file path;
- If your p12 file exported with password, remove it first with script `apns-p12-remove-password.sh`;
```Shell
apns-p12-remove-password.sh apns.p12
mv apns.p12 protected-apns.p12
mv unprotected.p12 apns.p12
```
Note: When running script, you will prompt enter the password, this is the password of you p12,
And next time prompt you enter password, you should not enter anything, just press enter twice.

### 使用方法
- 使用`apns-push-p12.sh`脚本;
- 替换变量 `P12_FILE` 为你导出的 p12 证书的路径;
- 如果你的 p12 文件导出了密码, 那么第一步需要执行脚本 `apns-p12-remove-password.sh`;
```Shell
apns-p12-remove-password.sh apns.p12
mv apns.p12 protected-apns.p12
mv unprotected.p12 apns.p12
```
## Use p8 certificate
通过p8证书方式进行推送
### Usage
- Use apns-push-p8.sh shell script;
- Replace variable `P8_FILE` with your generated p8 certificate file path;
- Set `AUTH_KEYID` and `AUTH_TEAMID` (from your apple developer account information);

### 使用方法
- 使用`apns-push-p8.sh`脚本;
- 替换变量 `P8_FILE` 为你产生的 p8 证书的路径;
- 并修改 `AUTH_KEYID` 和 `AUTH_TEAMID`（在创建 p8 证书时，从苹果开发者后台中获取）;