<form id="editPositionForm" name="editPositionForm" method="post">
<input type="hidden" id="positionId" name="positionId" value="{$post.profesionId}"/>
<ul id="sort-box" class="sorts">
  <li>              
    <div class="content-in-popup">
      
      <div class="content-settings-row">
            <label for="f1"><span class="reqField">*</span> Nombre:</label>
            <input type="text" name="name" id="name" value="{$post.profesionName}" />                      
      </div>
                  
      <div style="float:left"><span class="reqField">*</span> Campo requerido</div>
      <div style="padding-right:60px">                 
      <input type="button" class="btnCancel" style="margin-left:10px;" id="btnCancel" />
      <input type="button" class="btn-70-l" id="saveEditPosition" name="saveEditPosition" />                  
      </div>
      
    </div>
   </li>                              
 </ul>    
</form>