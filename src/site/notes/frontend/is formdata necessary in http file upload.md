---
{"dg-publish":true,"permalink":"/frontend/is-formdata-necessary-in-http-file-upload/","created":"2024-01-19T16:07:11.697+08:00","updated":"2024-02-29T11:23:07.990+08:00"}
---

### fetch API
当使用fetch API 时候，文件上传较简单，formData 非必需。是否使用，取决于后端接口
```javascript
// Select your input type file and store it in a variable
const input = document.getElementById('fileinput');

// This will upload the file after having read it
const upload = (file) => {
  fetch('http://www.example.net', { // Your POST endpoint
    method: 'POST',
    headers: {
      // Content-Type may need to be completely **omitted**
      // or you may need something
      "Content-Type": "You will perhaps need to define a content-type here"
    },
    body: file // This is your file object
  }).then(
    response => response.json() // if the response is a JSON object
  ).then(
    success => console.log(success) // Handle the success response object
  ).catch(
    error => console.log(error) // Handle the error response object
  );
};

// Event handler executed when a file is selected
const onSelectFile = () => upload(input.files[0]);

// Add a listener on your input
// It will be triggered when a file will be selected
input.addEventListener('change', onSelectFile, false);
```

### AJAX
当使用ajax 及相关库如axios 进行文件上传，formData 是必须的