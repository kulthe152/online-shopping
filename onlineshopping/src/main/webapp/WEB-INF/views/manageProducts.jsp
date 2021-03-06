<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<div class="container">
	<div class="row">
	
		<c:if test="${not empty message}">
		
			<div class="col-xs-12">
				<div class="alert alert-success alert-dismissible">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
						${message}
				</div>
			</div>
		</c:if>
		
		<div class="col-md-offset-2 col-md-8">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h4>Product Management</h4>
				</div>
				
				<div class="panel-body">
					<!-- FORM ELEMENTS -->
					<sf:form class="form-horizontal" modelAttribute="product"
						action="${contextRoot}/manage/products"
						method="POST"
						enctype="multipart/form-data"
					>
					
										
						<div class="form-group">
							<label class="control-label col-md-4" for="name">Enter Product Name: </label>
							<div class="col-md-8">
								<sf:input type="text" path="name" id="name" placeholder="Product Name" class="form-control"/> 
								<sf:errors path="name" cssClass="help-block" element="em"/>
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-4" for="brand">Enter Brand Name: </label>
							<div class="col-md-8">
								<sf:input type="text" path="brand" id="brand" placeholder="Brand Name" class="form-control"/> 
								<sf:errors path="brand" cssClass="help-block" element="em"/>
								<!-- <em class="help-block">Please enter Brand name!!</em> -->
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-4" for="description">Product Description: </label>
							<div class="col-md-8">
								<sf:textarea path="description" id="description" placeholder="Write a description" class="form-control"/> 
								<sf:errors path="description" cssClass="help-block" element="em"/>
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-4" for="unitPrice">Enter Unit Price : </label>
							<div class="col-md-8">
								<sf:input type="number" path="unitPrice" id="unitPrice" placeholder="Unit Price In &#8377" class="form-control"/> 
								<sf:errors path="unitPrice" cssClass="help-block" element="em"/>
								
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-4" for="quantity">Quantity Available : </label>
							<div class="col-md-8">
								<sf:input type="number" path="quantity" id="quantity" placeholder="Quantity Available" class="form-control"/> 
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-4" for="file">Select an Image : </label>
							<div class="col-md-8">
								<sf:input type="file" path="file" id="file" class="form-control"/> 
							</div>
						</div>
						
						<!-- file element for image upload -->
						
						<div class="form-group">
							<label class="control-label col-md-4" for="categoryId">Select Category : </label>
							<div class="col-md-8">
								<sf:select class="form-control" id="categoryId" path="categoryId"
									items="${categories}" 
									itemLabel="name"  
									itemValue="id"		
								/>
								
	<!--from where you get the items, so here we are get the item from ${categories} ManagementController.java check ModelAttribute-->
	<!--what you want to display from this category, so i want to display the name of category -->
	<!-- what will be the value, value would be nothing but the id but which id, that particular id -->
	<!-- but we want to store the id of the particular category and id will magically link with [ class="form-control" id="categoryId"] -->						
			
							</div>
						</div>						
						
						<div class="form-group">
							<div class="col-md-offset-4 col-md-8">
								<input type="submit" name="submit" id="submit" value="Submit" class="btn btn-primary"/> 
								
								<!-- hidden fields for products -->
								<sf:hidden path="id"/>
								<sf:hidden path="code"/>
								<sf:hidden path="supplierId"/>
								<sf:hidden path="active"/>
								<sf:hidden path="purchases"/>
								<sf:hidden path="views"/>
								
							</div>
						</div>
					
					
					</sf:form>
					
				
				</div>
			</div>
		</div>
	</div>
</div>