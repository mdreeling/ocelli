<%@ page import="com.dreeling.applications.grails.ocelli.Application"%>
<div class="row">
	<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
		<h1 class="page-title txt-color-blueDark">
			<i class="fa fa-table fa-fw "></i> Applications
		</h1>
	</div>
</div>

<!-- widget grid -->
<section id="widget-grid" class="">

	<!-- row -->
	<div class="row">

		<!-- NEW WIDGET START -->
		<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

			<!-- Widget ID (each widget will need unique ID)-->
			<div class="jarviswidget jarviswidget-color-greenDark" id="wid-id-2"
				data-widget-editbutton="false">

				<!-- widget div-->
				<div>

					<!-- widget edit box -->
					<div class="jarviswidget-editbox">
						<!-- This area used as dropdown edit box -->

					</div>
					<!-- end widget edit box -->

					<!-- widget content -->
					<div class="widget-body no-padding">

						<div class="alert alert-info no-margin fade in">
							<button class="close" data-dismiss="alert">×</button>
							<i class="fa-fw fa fa-info"></i> Applications available for
							monitoring are shown below
						</div>
						<div class="table-responsive">

							<table class="table table-hover">
								<thead>
									<tr>
										<th>Name</th>
										<th>Description</th>
									</tr>
								</thead>
								<tbody>
									<g:each in="${applicationInstanceList}" status="i"
										var="applicationInstance">
										<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

											<td><a
												href="#application/show/${applicationInstance.id}">
													${fieldValue(bean: applicationInstance, field: "appDescription")}
											</a></td>

											<td>
												${fieldValue(bean: applicationInstance, field: "appName")}
											</td>

										</tr>
									</g:each>

								</tbody>
							</table>

						</div>
					</div>
					<!-- end widget content -->

				</div>
				<!-- end widget div -->

			</div>
			<!-- end widget -->

		</article>
		<!-- WIDGET END -->
	</div>
	<!-- end row -->

</section>
<!-- end widget grid -->

<script type="text/javascript">
	/* DO NOT REMOVE : GLOBAL FUNCTIONS!
	 *
	 * pageSetUp(); WILL CALL THE FOLLOWING FUNCTIONS
	 *
	 * // activate tooltips
	 * $("[rel=tooltip]").tooltip();
	 *
	 * // activate popovers
	 * $("[rel=popover]").popover();
	 *
	 * // activate popovers with hover states
	 * $("[rel=popover-hover]").popover({ trigger: "hover" });
	 *
	 * // activate inline charts
	 * runAllCharts();
	 *
	 * // setup widgets
	 * setup_widgets_desktop();
	 *
	 * // run form elements
	 * runAllForms();
	 *
	 ********************************
	 *
	 * pageSetUp() is needed whenever you load a page.
	 * It initializes and checks for all basic elements of the page
	 * and makes rendering easier.
	 *
	 */

	pageSetUp();

	/*
	 * ALL PAGE RELATED SCRIPTS CAN GO BELOW HERE
	 * eg alert("my home function");
	 * 
	 * var pagefunction = function() {
	 *   ...
	 * }
	 * loadScript("js/plugin/_PLUGIN_NAME_.js", pagefunction);
	 * 
	 * TO LOAD A SCRIPT:
	 * var pagefunction = function (){ 
	 *  loadScript(".../plugin.js", run_after_loaded);	
	 * }
	 * 
	 * OR
	 * 
	 * loadScript(".../plugin.js", run_after_loaded);
	 */

	// PAGE RELATED SCRIPTS
	// pagefunction
	var pagefunction = function() {

	};

	// end pagefunction

	// run pagefunction on load

	pagefunction();
</script>
