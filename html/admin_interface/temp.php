div class="col-md-4">
							<label><?php echo trim($key);?><small class="required">*</small></label>

							<input type="text" class="form-control" id=<?php echo 'event_type' . $index; ?> event_type_id="<?php echo $event_info[$i]['event_type_id']; ?>" value="<?php echo trim($value);?>" required minlength="1" onblur="pageUpdate(id)">
						</div>