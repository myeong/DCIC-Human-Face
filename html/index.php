<!-- Main Content Section -->
<div class="container lg-font col-md-12" style="border:0px solid black;">

 <form id="survey_form" class="form-horizontal" style="border:0px dotted black;" action="insert.php" method="post">


    <div class="col-md-12" role="orgInfo-titlebar"  id="role-orgInfo-titlebar">
      <div class="section-title"><h3>1. Organizational Information</h3></div>
    </div>

    <div class="col-md-12" role="orgInfo"  id="role-orgInfo">
      <!-- Name of organization -->
      <div class="row col-md-12">
        <div class="form-group col-md-12">
          <div class="form-group col-md-10">
            <label for="org_name">Name of organization<small class="required">*</small></label>
            <input type="text" class="form-control" id="org_name" name="org_name" placeholder="" required minlength="2">
        </div>
        </div>
      </div>

      <!-- Description of organization -->
      <div class="form-group col-md-12">
        <div class="form-group col-md-10">
          <label for="org_description">One sentence description of organization <small class="required">(400 characters or less)*</small></label>
          <textarea type="text" class="form-control " id="org_description" name="org_description" required></textarea>
        </div>
      </div>

      <!-- Type of organization -->
      <div class="form-group col-md-12" id="org_type">
          <label for="org_type">Type of organization<small class="required">*</small></label>
          <label id="org_type-error" class="error" for="org_type"></label>
        <div class="col-md-10">
          <div class="btn-group" data-toggle="buttons" id="divSaleType">
            <label class="btn btn-default">
                <input type="radio" name="org_type" id="For_profit" value="For-profit"> For-profit
            </label>
            <label class="btn btn-default">
                <input type="radio" name="org_type" id="Nonprofit" value="Nonprofit"> Nonprofit
            </label>
            <label class="btn btn-default">
                <input type="radio" name="org_type" id="Developer_group" value="Developer group"> Developer group
            </label>
            <label class="btn btn-default">
                <input type="radio" name="org_type" id="Other" value="Other"> Other
            </label>
          </div>
        </div>
      </div>

  
      <!-- Industry/category of organization -->
      <div class="form-group col-md-12">
        <label for="industry_id">Industry/category of the organization <small class="required">(select 1)*</small></label>
        <label id="industry_id-error" class="error" for="industry_id"></label>
        <fieldset>
        <div class="col-md-4" id="industry_id_col-1">
          <input type="radio" name="industry_id" class="industry_id" value="Agriculture" required>&nbsp; Agriculture
          <br /><input type="radio" name="industry_id" class="industry_id" value="Arts and culture">&nbsp; Arts and culture
          <br /><input id="industry_id_cul" type="radio" name="industry_id" class="industry_id" value="Business and legal services" required>&nbsp; Business and legal services
          <br /><input type="radio" name="industry_id" class="industry_id" value="Consumer services">&nbsp; Consumer services
          <br /><input type="radio" name="industry_id" class="industry_id" value="Data/information technology">&nbsp; Data/information technology
          <br /><input type="radio" name="industry_id" class="industry_id" value="Education">&nbsp; Education
          <br /><input type="radio" name="industry_id" class="industry_id" value="Energy">&nbsp; Energy
          <br /><input type="radio" name="industry_id" class="industry_id" value="Environment">&nbsp; Environment
          <br /><input type="radio" name="industry_id" class="industry_id" value="Finance and investment">&nbsp; Finance and investment
        </div>
        <div class="col-md-4" id="industry_id_col-2">
          <input type="radio" name="industry_id" class="industry_id" value="Geospatial/mapping">&nbsp; Geospatial/mapping
          <br /><input type="radio" name="industry_id" class="industry_id" value="Governance">&nbsp; Governance
          <br /><input type="radio" name="industry_id" class="industry_id" value="Healthcare">&nbsp; Healthcare
          <br /><input type="radio" name="industry_id" class="industry_id" value="Housing/real estate">&nbsp; Housing and real estate
          <br /><input type="radio" name="industry_id" class="industry_id" value="Insurance">&nbsp; Insurance
          <br /><input type="radio" name="industry_id" class="industry_id" value="Media and communications">&nbsp; Media and communications
          <br /><input type="radio" name="industry_id" class="industry_id" value="Mining/manufacturing">&nbsp; Mining/manufacturing
          <br /><input type="radio" name="industry_id" class="industry_id" value="Research and consulting">&nbsp; Research and consulting
          <br /><input type="radio" name="industry_id" class="industry_id" value="Security and public safety">&nbsp; Security and public safety
        </div>
        <div class="col-md-4" id="industry_id_col-3">
          <input type="radio" name="industry_id" class="industry_id" value="Scientific research">&nbsp; Scientific research
          <br /><input type="radio" name="industry_id" class="industry_id" value="Telecommunications/internet service providers (ISPs)">&nbsp; Telecommunications/internet service providers (ISPs)
          <br /><input type="radio" name="industry_id" class="industry_id" value="Tourism">&nbsp; Tourism
          <br /><input type="radio" name="industry_id" class="industry_id" value="Transportation and logistics">&nbsp; Transportation and logistics
          <br /><input type="radio" name="industry_id" class="industry_id" value="Water and sanitation">&nbsp; Water and sanitation
          <br /><input type="radio" name="industry_id" class="industry_id" value="Weather">&nbsp; Weather
          <br /><input type="radio" name="industry_id" class="industry_id" id="industr_id_other" value="Other">&nbsp; Other
                <input type="text" class="form-control" style="display:none" id="industry_other" name="industry_other" placeholder="Describe other">
        </div>
        </fieldset>
      </div>

      <!-- Founding year -->    
      <div class="form-group col-md-12">
        <div class="form-group col-md-10">
          <label for="org_year_founded">Founding year<small class="required">*</small></label>
          <input type="text" class="form-control" id="org_year_founded" name="org_year_founded" placeholder="" minlength=4 maxlength=4 required>
        </div>
      </div>

      <!-- Size -->
      <div class="form-group col-md-12">
        <label for="org_size_id">Size<small class="required">*</small></label>
        <label id="org_size_id-error" class="error" for="org_size_id"></label>
        <div class="col-md-12">
          <div class="btn-group" data-toggle="buttons">
            <label class="btn btn-default">
                <input type="radio" name="org_size_id" value="1-10"> 1-10 employees
            </label>
            <label class="btn btn-default">
                <input type="radio" name="org_size_id" value="11-50"> 11-50 employees
            </label>
            <label class="btn btn-default">
                <input type="radio" name="org_size_id" value="51-200"> 51-200 employees
            </label>
            <label class="btn btn-default">
                <input type="radio" name="org_size_id" value="201-1000"> 201-1000 employees
            </label>
            <label class="btn btn-default">
                <input type="radio" name="org_size_id" value="1000+"> 1000+ employees
            </label>
          </div>
        </div>
      </div>

     
    </div><!--/OrgInfo-->

</form>

</div> 
