The download URL for Quick Share was retrieved using the application's official update mechanism.

You can get the URL of the latest version by running:

```bash
curl 'https://tools.google.com/service/update2/' --data '<?xml version="1.0" encoding="UTF-8"?><request><os platform="win" version="10.0.22000.978" sp="" arch="x64"/><app appid="{232066FE-FF4D-4C25-83B4-3F8747CF7E3A}" version="" nextversion="" lang="en"><updatecheck/></app></request>'
```

The update checker URL was found using mitmproxy.
