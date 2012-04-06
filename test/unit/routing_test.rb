require File.join(File.dirname(__FILE__), '..', 'test_helper')
require File.join(File.dirname(__FILE__), '..', 'blueprints', 'helper')

require 'test_helper'
require 'shoulda'
# require 'machinist'

class RoutingTest < ActionController::TestCase

  context "The main controller" do
    should "route to root" do
      assert_routing '/en', {:controller => 'main', :action=> 'login', :locale => 'en'}
    end
   end

  context "The API" do
    context "test_results resource" do
      setup do
        @path = '/en/api/test_results'
        @controller = 'api/test_results'
        @testResult = TestResult.make
      end
      should "route GET index correctly" do
        assert_routing({:path => @path,
                        :method => :get},
                       {:controller => @controller,
                        :action => 'index',
                        :format => 'text',
                        :locale => 'en'})
      end
      should "route POST create correctly" do
        assert_routing({:path => @path,
                        :method => :post},
                       {:controller => @controller,
                        :action => 'create',
                        :format => 'text',
                        :locale => 'en'})
      end
      should "route GET show correctly" do
        assert_routing({:path => @path + '/' + @testResult.id.to_s,
                        :method => :get},
                       {:controller => @controller,
                        :action => 'show',
                        :id => @testResult.id.to_s,
                        :locale => 'en',
                        :format => 'text'})
     end
      should "route PUT update correctly" do
        assert_routing({:path => @path + '/' + @testResult.id.to_s,
                        :method => :put},
                       {:controller => @controller,
                        :action => 'update',
                        :id => @testResult.id.to_s,
                        :format => 'text',
                        :locale => 'en'})
       end
      should "route DELETE destroy correctly" do
        assert_routing({:path => @path + '/' + @testResult.id.to_s,
                        :method => :delete},
                       {:controller => @controller,
                        :action => 'destroy',
                        :id => @testResult.id.to_s,
                        :format => 'text',
                        :locale => 'en'})
      end # end test_results route tests
      # TODO
      should "not have a route for GET new" do
        assert_raises(Test::Unit::AssertionFailedError) do
          assert_recognizes({},
                          @path + '/new')
        end
      end
    end
    context "submission_downloads resource" do
    end # end submission_downloads route tests
    context "users resource" do
    end # end user_resource route tests
    context "main_api resource" do
    end
  end # end API route tests

  context "Admin resource" do
    setup do
      @admin = Admin.make
      @path = '/en/admins'
      @controller = 'admins'
    end
    should "route GET index correctly" do
      assert_routing({:path => @path,
                      :method => :get},
                     {:controller => @controller,
                      :action => 'index',
                      :locale => 'en'})
    end
    should "route GET new correctly" do
      assert_routing({:path => @path + '/new',
                      :method => :get},
                     {:controller => @controller,
                      :action => 'new',
                      :locale => 'en'})
    end
    should "route POST create correctly" do
      assert_routing({:path => @path,
                      :method => :post},
                     {:controller => @controller, 
                      :action => 'create',
                      :locale => 'en'})
    end
    should "route GET show correctly" do
      assert_routing({:path => @path + '/' + @admin.id.to_s,
                      :method => :get},
                     {:controller => @controller,
                      :action => 'show',
                      :id => @admin.id.to_s,
                      :locale => 'en'})
   end
    should "route GET edit correctly" do
      assert_routing({:path => @path + '/' + @admin.id.to_s + '/edit',
                      :method => :get},
                     {:controller => @controller,
                      :action => 'edit',
                      :id => @admin.id.to_s,
                      :locale => 'en'})
    end
    should "route PUT update correctly" do
      assert_routing({:path => @path + '/' + @admin.id.to_s,
                      :method => :put},
                     {:controller => @controller,
                      :action => 'update',
                      :id => @admin.id.to_s,
                      :locale => 'en'})
     end
    should "route DELETE destroy correctly" do
      assert_routing({:path => @path + '/' + @admin.id.to_s,
                      :method => :delete},
                     {:controller => @controller,
                      :action => 'destroy',
                      :id => @admin.id.to_s,
                      :locale => 'en'})
    end
    should "route POST populate on a collection correctly" do
      assert_routing({:path => @path + '/populate',
                      :method => :post},
                     {:controller => @controller,
                      :action => 'populate',
                      :locale => 'en'})
    end
   end # end Admin resource route tests
  
  context "An Assignment" do
    setup do
      @path = '/en/assignments'
      @controller = 'assignments'      
    end
    context "collection" do
      should "route GET download_csv_grades_report properly" do
        assert_routing({:path => @path + '/download_csv_grades_report',
                        :method => :get},
                       {:controller => @controller,
                        :action => 'download_csv_grades_report',
                        :locale => 'en'})      
      end
      should "route GET update_group_properties_on_persist properly" do
        assert_routing({:path => @path + '/update_group_properties_on_persist',
                        :method => :get},
                       {:controller => @controller,
                        :action => 'update_group_properties_on_persist',
                        :locale => 'en'})      
      end
      should "route GET delete_rejected properly" do
        assert_routing({:path => @path + '/delete_rejected',
                        :method => :get},
                       {:controller => @controller,
                        :action => 'delete_rejected',
                        :locale => 'en'})      
      end
      should "route POST update_collected_submissions" do
        assert_routing({:path => @path + '/update_collected_submissions',
                        :method => :post},
                       {:controller => @controller,
                        :action => 'update_collected_submissions',
                        :locale => 'en'})      
      end
    end # end assignments collection routes test
    context "member" do
      should "route GET refresh_graph properly" do
         assert_routing({:path => @path + '/1/refresh_graph',
                        :method => :get},
                       {:controller => @controller,
                        :action => 'refresh_graph',
                        :id => '1',
                        :locale => 'en'})        
      end
      should "route GET student_interface properly" do
         assert_routing({:path => @path + '/1/student_interface',
                        :method => :get},
                       {:controller => @controller,
                        :action => 'student_interface',
                        :id => '1',
                        :locale => 'en'})        
      end
     # should "route GET update_group_properties_on_persist properly" do
     #    assert_routing({:path => @path + '/1/update_group_properties_on_persist',
     #                   :method => :get},
     #                  {:controller => @controller,
     #                   :action => 'update_group_properties_on_persist',
     #                   :id => '1',
     #                   :locale => 'en'})        
     # end
      should "route POST invite_member properly" do
         assert_routing({:path => @path + '/1/invite_member',
                        :method => :post},
                       {:controller => @controller,
                        :action => 'invite_member',
                        :id => '1',
                        :locale => 'en'})          
     end
     should "route GET creategroup properly" do
         assert_routing({:path => @path + '/1/creategroup',
                        :method => :get},
                       {:controller => @controller,
                        :action => 'creategroup',
                        :id => '1',
                        :locale => 'en'})          
     end
     should "route GET join_group properly" do
         assert_routing({:path => @path + '/1/join_group',
                        :method => :get},
                       {:controller => @controller,
                        :action => 'join_group',
                        :id => '1',
                        :locale => 'en'})          
     end
     should "route GET deletegroup properly" do
         assert_routing({:path => @path + '/1/deletegroup',
                        :method => :get},
                       {:controller => @controller,
                        :action => 'deletegroup',
                        :id => '1',
                        :locale => 'en'})          
     end
     should "route GET decline_invitation properly" do
         assert_routing({:path => @path + '/1/decline_invitation',
                        :method => :get},
                       {:controller => @controller,
                        :action => 'decline_invitation',
                        :id => '1',
                        :locale => 'en'})          
     end
     should "route GET disinvite_member properly" do
         assert_routing({:path => @path + '/1/decline_invitation',
                        :method => :get},
                       {:controller => @controller,
                        :action => 'decline_invitation',
                        :id => '1',
                        :locale => 'en'})          
     end
     should "route GET render_test_result properly" do
         assert_routing({:path => @path + '/1/render_test_result',
                        :method => :get},
                       {:controller => @controller,
                        :action => 'render_test_result',
                        :id => '1',
                        :locale => 'en'})          
     end
    end # end assignments members route tests
    context "'s rubrics" do
      setup do
        @path = @path + "/1/rubrics"
        @controller = "rubrics"
      end
      context "member" do
        should "route DELETE destroy properly" do
          assert_routing({:path => @path + '/1',
                        :method => :delete},
                       {:controller => @controller,
                        :action => 'destroy',
                        :id => '1',
                        :assignment_id => '1',
                        :locale => 'en'})          
         
        end
        should "route GET move_criterion properly" do
          assert_routing({:path => @path + '/1/move_criterion',
                        :method => :get},
                       {:controller => @controller,
                        :action => 'move_criterion',
                        :id => '1',
                        :assignment_id => '1',
                        :locale => 'en'})
        end
      end # end rubric member route tests
      context "collection" do
        should "route POST update_positions properly" do
          assert_routing({:path => @path + '/update_positions',
                          :method => :post},
                         {:controller => @controller,
                          :action => 'update_positions',
                          :assignment_id => '1',
                          :locale => 'en'})      
        end
        should "route POST csv_upload properly" do
          assert_routing({:path => @path + '/csv_upload',
                          :method => :post},
                         {:controller => @controller,
                          :action => 'csv_upload',
                          :assignment_id => '1',
                          :locale => 'en'})            
        end
        should "route POST yml_upload properly" do
          assert_routing({:path => @path + '/yml_upload',
                          :method => :post},
                         {:controller => @controller,
                          :action => 'yml_upload',
                          :assignment_id => '1',
                          :locale => 'en'})            
        end
        should "route GET download_csv properly" do
          assert_routing({:path => @path + '/download_csv',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'download_csv',
                          :assignment_id => '1',
                          :locale => 'en'})            
        end
        should "route GET download_yml properly" do
          assert_routing({:path => @path + '/download_yml',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'download_yml',
                          :assignment_id => '1',
                          :locale => 'en'})            
        end
      end # end assignment rubric collection route tests
    end # end assignment rubrics route tests
    context "'s flexible_criteria" do
      context "collection" do
        setup do
          @path = path + "/flexible_criteria"
          @controller = "flexible_criteria"
        end
      context "collection" do
        should "route POST upload properly" do
          assert_routing({:path => @path + '/upload',
                          :method => :post},
                         {:controller => @controller,
                          :action => 'upload',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route GET update_positions" do
          assert_routing({:path => @path + '/update_positions',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'update_positions',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route GET move_criterion" do
          assert_routing({:path => @path + '/move_criterion',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'move_criterion',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
         should "route GET download properly" do
          assert_routing({:path => @path + '/download',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'download',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
      end # end assignment flexible_criteria collection test
    end # end assignment flexible_criteria test
    context "'s automated_tests" do
      setup do
        @path = @path + "/1/automated_tests"
        @controller = "automated_tests"
      end
      context "collection" do
        should "route GET manage properly" do
          assert_routing({:path => @path + '/manage',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'manage',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route POST update properly" do
          assert_routing({:path => @path,
                          :method => :post},
                         {:controller => @controller,
                          :action => 'update',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route POST update_positions properly" do
           assert_routing({:path => @path + '/update_positions',
                          :method => :post},
                         {:controller => @controller,
                          :action => 'update_positions',
                          :assignment_id => '1',
                          :locale => 'en'})         
        end
        should "route GET update_positions properly" do
          assert_routing({:path => @path + '/update_positions',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'update_positions',
                          :assignment_id => '1',
                          :locale => 'en'})          
        end
        should "route POST upload properly" do
          assert_routing({:path => @path + '/upload',
                          :method => :post},
                         {:controller => @controller,
                          :action => 'upload',
                          :assignment_id => '1',
                          :locale => 'en'})          
        end
        should "route GET download properly" do
          assert_routing({:path => @path + '/download',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'download',
                          :assignment_id => '1',
                          :locale => 'en'})          
        end
        should "route GET move_criterion properly" do
          assert_routing({:path => @path + '/move_criterion',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'move_criterion',
                          :assignment_id => '1',
                          :locale => 'en'})          
        end
      end # end assignment automated_test collection tests
    end # end assignment automated_tests resource route tests
    context "'s groups" do
      setup do
        @path = @path + "/1/groups"
        @controller = "groups"
      end
      context "members" do
        should "route POST rename_group properly" do
          assert_routing({:path => @path + '/1/rename_group',
                        :method => :post},
                       {:controller => @controller,
                        :action => 'rename_group',
                        :id => '1',
                        :assignment_id => '1',
                        :locale => 'en'})
        end
        should "route GET rename_group_dialog" do
          assert_routing({:path => @path + '/1/rename_group_dialog',
                        :method => :get},
                       {:controller => @controller,
                        :action => 'rename_group_dialog',
                        :id => '1',
                        :assignment_id => '1',
                        :locale => 'en'})          
        end
      end # end assignment groups member route tests
      context "collection" do
        should "route POST populate properly" do
          assert_routing({:path => @path + '/populate',
                          :method => :post},
                         {:controller => @controller,
                          :action => 'populate',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route POST populate_students properly" do
          assert_routing({:path => @path + '/populate_students',
                          :method => :post},
                         {:controller => @controller,
                          :action => 'populate_students',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route GET add_group properly" do
          assert_routing({:path => @path + '/add_group',
                          :method => :post},
                         {:controller => @controller,
                          :action => 'add_group',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route GET use_another_assignment_groups properly" do
          assert_routing({:path => @path + '/use_another_assignment_groups',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'use_another_assignment_groups',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route GET manage properly" do
          assert_routing({:path => @path + '/manage',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'manage',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route POST csv_upload properly" do
          assert_routing({:path => @path + '/csv_upload',
                          :method => :post},
                         {:controller => @controller,
                          :action => 'csv_upload',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route GET add_csv_group properly" do
          assert_routing({:path => @path + '/add_csv_group',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'add_csv_group',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route GET download_grouplist properly" do
          assert_routing({:path => @path + '/download_grouplist',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'download_grouplist',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route GET create_groups_when_students_work_alone properly" do
          assert_routing({:path => @path + '/create_groups_when_students_work_alone',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'create_groups_when_students_work_alone',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route GET valid_grouping properly" do
          assert_routing({:path => @path + '/valid_grouping',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'valid_grouping',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route GET invalid_grouping properly" do
          assert_routing({:path => @path + '/invalid_grouping',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'invalid_grouping',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route GET global_actions properly" do
          assert_routing({:path => @path + '/global_actions',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'global_actions',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route GET rename_group properly" do
          assert_routing({:path => @path + '/rename_group',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'rename_group',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route DELETE remove_group properly" do
          assert_routing({:path => @path + '/remove_group',
                          :method => :delete},
                         {:controller => @controller,
                          :action => 'remove_group',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route POST add_group properly" do
          assert_routing({:path => @path + '/add_group',
                          :method => :post},
                         {:controller => @controller,
                          :action => 'add_group',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route POST global_actions properly" do
          assert_routing({:path => @path + '/global_actions',
                          :method => :post},
                         {:controller => @controller,
                          :action => 'global_actions',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
      end # end assignment groups collection route tests   
    end # end assignment groups route tests
  end # end assignments resource route tests
end
