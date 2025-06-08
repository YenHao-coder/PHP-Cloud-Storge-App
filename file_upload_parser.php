<?php
/**
 * The file name
 * File in the PHP tmp folder
 * The type of file it is
 * File size in bytes
 * '0' for false ... and '1' for true
 */
$fileName = $_FILES['file1']['name'];
$fileTmploc = $_FILES['file1']['tmp_name'];
$fileType = $_FILES['file1']['type'];
$fileSize = $_FILES['file1']['size'];
$fileErrorMsg = $_FILES['file1']['error'];

if(!$fileTmploc){
    $retcode = array('success' => 'false','msg' => '', 'error' => '上傳暫存檔無法建立!', 'fileName' =>'');
    echo json_encode($retcode, JSON_UNESCAPED_UNICODE);
    exit();
}
if(move_uploaded_file($fileTmploc, "uploads/$fileName")){
    $retcode = array('success'=>'true','msg'=>'完成檔案上傳', 'error'=>'', 'fileName'=>$fileName);
} else{
    $retcode = array('success'=>'false','msg'=>'', 'error'=>'無法完成檔案上傳', 'fileName'=>'');
}
echo json_encode($retcode, JSON_UNESCAPED_UNICODE);
?>