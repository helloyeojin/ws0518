<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    function loadFile(uinput){
        var ufile = uinput.files[0];

        var ufilename = document.getElementById('filename');
        ufilename.textcontent = ufile.name;

        var newImage = document.createElement("uimg");
        newImage.setAttribute("class", 'uimg');

        newImage.src = URL.createObjectURL(file);

        newImage.style.width = "70%";
        newImage.style.height = "70%";
        newImage.style.visibility = "hidden";
        newImage.style.objectFit = "contain";

        var container = document.getElementById('image-show');
        container.appendChild(newImage);
    }
    let anc_register = {
        init:()=>{
            $('#anc_register_btn').click(() =>{
                anc_register.send();
            });
            $('#anc_can_btn').click(()=>{
                location.href = '/anc/all';
            })
        },
        send:()=>{
            $('#anc_register_form').attr({
                action:'/anc/addimpl',
                method:'post',
                enctype:'multipart/form-data'
            });
            $('#anc_register_form').submit();
        }
    };
    // let file_upload = {
    //     init: function(){
    //         fileForm = document.getElementById('fileForm');
    //         file = document.getElementById('file');
    //         console.log("file", file.files);
    //         fileForm.addEventListener('change', function(){
    //             fileList="";
    //             for(i=0; i<file.files.length; i++){
    //                 fileList += file.files[i].name + '<br>';
    //             }
    //             filename = document.getElementById('filename');
    //             filename.innerHTML = fileList;
    //         });
    //     }
    // }
    $(function(){
        anc_register.init();
        // file_upload.init();
    });
</script>

<!-- partial -->

<div class="content-wrapper">
    <div class="row" style="justify-content: center">

        <div class="col-8 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Add Announcement</h4>
                    <p class="card-description">
                        Fill in the blanks below
                    </p>

                    <form id = "anc_register_form" class="forms-sample" name="anc_register_form" enctype="multipart/form-data" method="post">
                        <div class="form-group">
                            <label for="writer">Writer</label>
                            <input type="text" class="form-control" name = "writer" id="writer" value = "${loginadm.id}"} readonly>
                        </div>
                        <div class="form-group">
                            <label for="title">Title</label>
                            <input type="text" class="form-control" name = "title" id="title" placeholder="Input Title">
                        </div>
                        <div class="form-group">
                            <label for="contents">Contents</label>
                            <textarea class="form-control" id="contents" name="contents" rows="6"></textarea>
                        </div>

                        <div class="form-group">
                            <label>File upload</label>
                            <input type="file" name="filename" class="file-upload-default">
                            <div class="input-group col-xs-12" id="fileForm">
                                <input type="text" id=filename class="form-control file-upload-info" disabled placeholder="Upload Image">
                                <label for="file" class="input-group-prepend" style="height: 46px">
                                    <div class="file-upload-browse btn btn-outline-primary">Upload</div>
                                </label>
                                <input type="file" name="file" id="file" style="visibility: hidden" onchange="loadFile(this)">
                            </div>
                        </div>
                        <div style="float: right">
                            <button id = "anc_register_btn" type="button" class="btn btn-primary mr-2">Update</button>
                            <button id = "anc_can_btn" type="button" class="btn btn-outline-primary">Delete</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>
</div>
<!-- content-wrapper ends -->
