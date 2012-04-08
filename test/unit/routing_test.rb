require File.join(File.dirname(__FILE__), '..', 'test_helper')
require File.join(File.dirname(__FILE__), '..', 'blueprints', 'helper')

require 'test_helper'
require 'shoulda'

class RoutingTest < ActionController::TestCase

  context "The main controller" do
    should "route to root" do
      assert_routing '/en', {:controller => 'main', :action=> 'login', :locale => 'en'}
    end
   end

  context "The API" do
    setup do
      @path = "en/api"
    end
    context "test_results" do
      should "not route GET new" do
        assert_raises(Test::Unit::AssertionFailedError) do
          assert_recognizes({:controller => 'test_results',
                              :action=>'new'},
                              {:path => @path + "/test_results/new",
                               :method => :get})
        end
      end
      should "not route GET edit" do
          assert_raises(Test::Unit::AssertionFailedError) do
            assert_recognizes({:controller => 'test_results',
                              :action=>'edit'},
                              {:path => @path + "/test_results/edit",
                               :method => :get})
          end
      end
    end # end API test_results route tests
    context "submission_downloads" do
      should "not route GET new" do
        assert_raises(Test::Unit::AssertionFailedError) do
          assert_recognizes({:controller => 'submission_downloads',
                              :action=>'new'}, 
                              {:path => @path + "/submission_downloads/new",
                               :method => :get})
        end
      end
      should "not route GET edit" do
          assert_raises(Test::Unit::AssertionFailedError) do
            assert_recognizes({:controller => 'submission_downloads',
                              :action=>'edit'},
                              {:path => @path + "/submission_downloads/edit",
                               :method => :get})
          end
      end
    end # end API submission_downloads route tests
    context "users" do
      should "not route GET new" do
        assert_raises(Test::Unit::AssertionFailedError) do
          assert_recognizes({:controller => 'users',
                              :action=>'new'},
                              {:path => @path + "/users/new",
                               :method => :get})
        end
      end
      should "not route GET edit" do
        assert_raises(Test::Unit::AssertionFailedError) do
          assert_recognizes({:controller => 'users',
                              :action=>'edit'},
                              {:path => @path + "/users/edit",
                               :method => :get})
      end
    end
   end # end API usrs route tests
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
      end # end assignment rubric member route tests
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
          @path = @path + "/1/flexible_criteria"
          @controller = "flexible_criteria"
        end
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
    context "groups" do
      setup do
        @path = @path + "/1/groups"
        @controller = "groups"
      end
      context "resource members" do
        should "route POST rename_group properly" do
          assert_routing({:path => @path + '/1/rename_group',
                        :method => :post},
                       {:controller => @controller,
                        :action => 'rename_group',
                        :id => '1',
                        :assignment_id => '1',
                        :locale => 'en'})
        end
        should "route GET rename_group_dialog properly" do
          assert_routing({:path => @path + '/1/rename_group_dialog',
                        :method => :get},
                       {:controller => @controller,
                        :action => 'rename_group_dialog',
                        :id => '1',
                        :assignment_id => '1',
                        :locale => 'en'})
        end
      end # end assignment group members route tests
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
                          :method => :get},
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
      end # end assignment group collection route tests
    end # end assignment groups route tests
    context "submission" do
      setup do
        @path = @path + "/1/submissions"
        @controller = "submissions"
      end
      context "collection" do
        should "route GET file_manager properly" do
          assert_routing({:path => @path + '/file_manager',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'file_manager',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route GET browse properly" do
          assert_routing({:path => @path + '/browse',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'browse',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route POST populate_file_manager properly" do
          assert_routing({:path => @path + '/populate_file_manager',
                          :method => :post},
                         {:controller => @controller,
                          :action => 'populate_file_manager',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route GET collect_all_submissions properly" do
          assert_routing({:path => @path + '/collect_all_submissions',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'collect_all_submissions',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route GET download_simple_csv_report properly" do
          assert_routing({:path => @path + '/download_simple_csv_report',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'download_simple_csv_report',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route GET download_detailed_csv_report properly" do
          assert_routing({:path => @path + '/download_detailed_csv_report',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'download_detailed_csv_report',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route GET download_svn_export_list properly" do
          assert_routing({:path => @path + '/download_svn_export_list',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'download_svn_export_list',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route GET download_svn_export_commands properly" do
          assert_routing({:path => @path + '/download_svn_export_commands',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'download_svn_export_commands',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route GET download_svn_repo_list properly" do
          assert_routing({:path => @path + '/download_svn_repo_list',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'download_svn_repo_list',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route GET collect_ta_submissions properly" do
          assert_routing({:path => @path + '/collect_ta_submissions',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'collect_ta_submissions',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route GET update_submissions properly" do
          assert_routing({:path => @path + '/update_submissions',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'update_submissions',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route POST populate_repo_browser properly" do
          assert_routing({:path => @path + '/populate_repo_browser',
                          :method => :post},
                         {:controller => @controller,
                          :action => 'populate_repo_browser',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route POST update_converted_pdfs properly" do
          assert_routing({:path => @path + '/update_converted_pdfs',
                          :method => :post},
                         {:controller => @controller,
                          :action => 'update_converted_pdfs',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route GET updated_files properly" do
          assert_routing({:path => @path + '/updated_files',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'updated_files',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route GET replace_files properly" do
          assert_routing({:path => @path + '/replace_files',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'replace_files',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route GET delete_files properly" do
          assert_routing({:path => @path + '/delete_files',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'delete_files',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route POST update_files properly" do
          assert_routing({:path => @path + '/update_files',
                          :method => :post},
                         {:controller => @controller,
                          :action => 'update_files',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route POST server_time properly" do
          assert_routing({:path => @path + '/server_time',
                          :method => :post},
                         {:controller => @controller,
                          :action => 'server_time',
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
      end # end assignment submissions collection route tests
      context "member" do
        should "route GET collect_and_begin_grading properly" do
          assert_routing({:path => @path + '/1/collect_and_begin_grading',
                        :method => :get},
                       {:controller => @controller,
                        :action => 'collect_and_begin_grading',
                        :id => '1',
                        :assignment_id => '1',
                        :locale => 'en'})
        end
        should "route POST manually_collect_and_begin_grading properly" do
          assert_routing({:path => @path + '/1/manually_collect_and_begin_grading',
                        :method => :post},
                       {:controller => @controller,
                        :action => 'manually_collect_and_begin_grading',
                        :id => '1',
                        :assignment_id => '1',
                        :locale => 'en'})
        end
        should "route GET repo_browser properly" do
          assert_routing({:path => @path + '/1/repo_browser',
                        :method => :get},
                       {:controller => @controller,
                        :action => 'repo_browser',
                        :id => '1',
                        :assignment_id => '1',
                        :locale => 'en'})
        end
      end # end assignment submissions member route tests
      context "results" do
        setup do
          @path = @path + "/1/results"
          @controller = "results"
        end
        context "collection" do
          should "route GET update_mark properly" do
            assert_routing({:path => @path + '/update_mark',
                            :method => :get},
                           {:controller => @controller,
                            :action => 'update_mark',
                            :assignment_id => '1',
                            :submission_id => '1',
                            :locale => 'en'})
          end
          should "route GET expand_criteria properly" do
            assert_routing({:path => @path + '/expand_criteria',
                            :method => :get},
                           {:controller => @controller,
                            :action => 'expand_criteria',
                            :assignment_id => '1',
                            :submission_id => '1',
                            :locale => 'en'})
          end
          should "route GET collapse_criteria properly" do
            assert_routing({:path => @path + '/collapse_criteria',
                            :method => :get},
                           {:controller => @controller,
                            :action => 'collapse_criteria',
                            :assignment_id => '1',
                            :submission_id => '1',
                            :locale => 'en'})
          end
          should "route GET expand_unmarked_criteria properly" do
            assert_routing({:path => @path + '/expand_unmarked_criteria',
                            :method => :get},
                           {:controller => @controller,
                            :action => 'expand_unmarked_criteria',
                            :assignment_id => '1',
                            :submission_id => '1',
                            :locale => 'en'})
          end
          should "route GET edit properly" do
            assert_routing({:path => @path + '/edit',
                            :method => :get},
                           {:controller => @controller,
                            :action => 'edit',
                            :assignment_id => '1',
                            :submission_id => '1',
                            :locale => 'en'})
          end
          should "route GET download properly" do
            assert_routing({:path => @path + '/download',
                            :method => :get},
                           {:controller => @controller,
                            :action => 'download',
                            :assignment_id => '1',
                            :submission_id => '1',
                            :locale => 'en'})
          end
        end # end assignment submissions results collection route tests
        context "member" do
          should "route GET add_extra_marks properly" do
            assert_routing({:path => @path + '/1/add_extra_marks',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'add_extra_marks',
                          :id => '1',
                          :assignment_id => '1',
                          :submission_id => '1',
                          :locale => 'en'})
          end
          should "route GET add_extra_mark properly" do
            assert_routing({:path => @path + '/1/add_extra_mark',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'add_extra_mark',
                          :id => '1',
                          :assignment_id => '1',
                          :submission_id => '1',
                          :locale => 'en'})
          end
         # should "route GET download properly" do
         #   assert_routing({:path => @path + '/1/download',
         #                 :method => :get},
         #                {:controller => @controller,
         #                 :action => 'download',
         #                 :id => '1',
         #                 :assignment_id => '1',
         #                 :submission_id => '1',
         #                 :locale => 'en'})            
         # end
         # should "route POST download properly" do
         #   assert_routing({:path => @path + '/1/download',
         #                 :method => :post},
         #                {:controller => @controller,
         #                 :action => 'download',
         #                 :id => '1',
         #                 :assignment_id => '1',
         #                 :submission_id => '1',
         #                 :locale => 'en'})            
         # end
          should "route GET cancel_remark_request properly" do
            assert_routing({:path => @path + '/1/cancel_remark_request',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'cancel_remark_request',
                          :id => '1',
                          :assignment_id => '1',
                          :submission_id => '1',
                          :locale => 'en'})
          end
          should "route GET codeviewer properly" do
            assert_routing({:path => @path + '/1/codeviewer',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'codeviewer',
                          :id => '1',
                          :assignment_id => '1',
                          :submission_id => '1',
                          :locale => 'en'})
          end
          should "route POST codeviewer properly" do
            assert_routing({:path => @path + '/1/codeviewer',
                          :method => :post},
                         {:controller => @controller,
                          :action => 'codeviewer',
                          :id => '1',
                          :assignment_id => '1',
                          :submission_id => '1',
                          :locale => 'en'})
          end
        #  should "route POST collapse_criteria properly" do
        #    assert_routing({:path => @path + '/1/collapse_criteria',
        #                  :method => :post},
        #                 {:controller => @controller,
        #                  :action => 'collapse_criteria',
        #                  :id => '1',
        #                  :assignment_id => '1',
        #                  :submission_id => '1',
        #                  :locale => 'en'})            
        #  end
          should "route POST add_extra_mark properly" do
            assert_routing({:path => @path + '/1/add_extra_mark',
                          :method => :post},
                         {:controller => @controller,
                          :action => 'add_extra_mark',
                          :id => '1',
                          :assignment_id => '1',
                          :submission_id => '1',
                          :locale => 'en'})
          end
          should "route GET next_grouping properly" do
            assert_routing({:path => @path + '/1/next_grouping',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'next_grouping',
                          :id => '1',
                          :assignment_id => '1',
                          :submission_id => '1',
                          :locale => 'en'})
          end
          should "route POST remove_extra_mark properly" do
            assert_routing({:path => @path + '/1/remove_extra_mark',
                          :method => :post},
                         {:controller => @controller,
                          :action => 'remove_extra_mark',
                          :id => '1',
                          :assignment_id => '1',
                          :submission_id => '1',
                          :locale => 'en'})
          end
         # should "route POST expand_unmarked_criteria properly" do
         #   assert_routing({:path => @path + '/1/expand_unmarked_criteria',
         #                 :method => :post},
         #                {:controller => @controller,
         #                 :action => 'expand_unmarked_criteria',
         #                 :id => '1',
         #                 :assignment_id => '1',
         #                 :submission_id => '1',
         #                 :locale => 'en'})            
         # end
          should "route GET set_released_to_students properly" do
            assert_routing({:path => @path + '/1/set_released_to_students',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'set_released_to_students',
                          :id => '1',
                          :assignment_id => '1',
                          :submission_id => '1',
                          :locale => 'en'})
          end
          should "route POST update_overall_comment properly" do
            assert_routing({:path => @path + '/1/update_overall_comment',
                          :method => :post},
                         {:controller => @controller,
                          :action => 'update_overall_comment',
                          :id => '1',
                          :assignment_id => '1',
                          :submission_id => '1',
                          :locale => 'en'})
          end
          should "route POST update_overall_remark_comment properly" do
            assert_routing({:path => @path + '/1/update_overall_remark_comment',
                          :method => :post},
                         {:controller => @controller,
                          :action => 'update_overall_remark_comment',
                          :id => '1',
                          :assignment_id => '1',
                          :submission_id => '1',
                          :locale => 'en'})
          end
          should "route POST update_marking_state properly" do
            assert_routing({:path => @path + '/1/update_marking_state',
                          :method => :post},
                         {:controller => @controller,
                          :action => 'update_marking_state',
                          :id => '1',
                          :assignment_id => '1',
                          :submission_id => '1',
                          :locale => 'en'})
          end
          should "route GET update_remark_request properly" do
            assert_routing({:path => @path + '/1/update_remark_request',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'update_remark_request',
                          :id => '1',
                          :assignment_id => '1',
                          :submission_id => '1',
                          :locale => 'en'})
          end
          should "route GET update_positions properly" do
            assert_routing({:path => @path + '/1/update_positions',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'update_positions',
                          :id => '1',
                          :assignment_id => '1',
                          :submission_id => '1',
                          :locale => 'en'})
          end
        #  should "route GET update_mark properly" do
        #    assert_routing({:path => @path + '/1/update_mark',
        #                  :method => :get},
        #                 {:controller => @controller,
        #                  :action => 'update_mark',
        #                  :id => '1',
        #                  :assignment_id => '1',
        #                  :submission_id => '1',
        #                  :locale => 'en'})            
        #  end
        # should "route GET expand_criteria properly" do
        #   assert_routing({:path => @path + '/1/expand_criteria',
        #                 :method => :get},
        #                {:controller => @controller,
        #                  :action => 'expand_criteria',
        #                  :id => '1',
        #                  :assignment_id => '1',
        #                  :submission_id => '1',
        #                  :locale => 'en'})            
        #  end
          should "route GET view_marks properly" do
            assert_routing({:path => @path + '/1/view_marks',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'view_marks',
                          :id => '1',
                          :assignment_id => '1',
                          :submission_id => '1',
                          :locale => 'en'})
          end
        end # end assignment submission results member route tests
      end # end assignment submission results route tests
    end # end assignment submissions route tests
    context "graders" do
      setup do
        @path = @path + "/1/graders"
        @controller = "graders"
      end
      context "collection" do
        should "route GET add_grader_to_grouping properly" do
          assert_routing({:path => @path + '/add_grader_to_grouping',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'add_grader_to_grouping',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route POST csv_upload_grader_groups_mapping properly" do
          assert_routing({:path => @path + '/csv_upload_grader_groups_mapping',
                          :method => :post},
                         {:controller => @controller,
                          :action => 'csv_upload_grader_groups_mapping',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route POST csv_upload_grader_criteria_mapping properly" do
          assert_routing({:path => @path + '/csv_upload_grader_criteria_mapping',
                          :method => :post},
                         {:controller => @controller,
                          :action => 'csv_upload_grader_criteria_mapping',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route GET download_grader_groupings_mapping properly" do
          assert_routing({:path => @path + '/download_grader_groupings_mapping',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'download_grader_groupings_mapping',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route GET download_grader_criteria_mapping properly" do
          assert_routing({:path => @path + '/download_grader_criteria_mapping',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'download_grader_criteria_mapping',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route GET download_dialog properly" do
          assert_routing({:path => @path + '/download_dialog',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'download_dialog',
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
        should "route GET grader_criteria_dialog properly" do
          assert_routing({:path => @path + '/grader_criteria_dialog',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'grader_criteria_dialog',
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
        should "route GET groups_coverage_dialog properly" do
          assert_routing({:path => @path + '/groups_coverage_dialog',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'groups_coverage_dialog',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route POST populate_graders properly" do
          assert_routing({:path => @path + '/populate_graders',
                          :method => :post},
                         {:controller => @controller,
                          :action => 'populate_graders',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route POST populate properly" do
          assert_routing({:path => @path + '/populate',
                          :method => :post},
                         {:controller => @controller,
                          :action => 'populate',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route POST populate_criteria properly" do
          assert_routing({:path => @path + '/populate_criteria',
                          :method => :post},
                         {:controller => @controller,
                          :action => 'populate_criteria',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route POST set_assign_criteria properly" do
          assert_routing({:path => @path + '/set_assign_criteria',
                          :method => :post},
                         {:controller => @controller,
                          :action => 'set_assign_criteria',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route GET random_assign properly" do
          assert_routing({:path => @path + '/random_assign',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'random_assign',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route GET upload_dialog properly" do
          assert_routing({:path => @path + '/upload_dialog',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'upload_dialog',
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
      end # end assignment graders collection route tests
    end # end assignment graders route tests
    context "annotation_categories" do
      setup do
        @path = @path + "/1/annotation_categories"
        @controller = "annotation_categories"
      end
      context "members" do
       should "route GET get_annotations properly" do
        assert_routing({:path => @path + '/1/get_annotations',
                              :method => :get},
                             {:controller => @controller,
                              :action => 'get_annotations',
                              :id => '1',
                              :assignment_id => '1',
                              :locale => 'en'})
        end
       should "route DELETE delete_annotation_category properly" do
        assert_routing({:path => @path + '/1/delete_annotation_category',
                              :method => :delete},
                             {:controller => @controller,
                              :action => 'delete_annotation_category',
                              :id => '1',
                              :assignment_id => '1',
                              :locale => 'en'})
        end
       should "route DELETE delete_annotation_text properly" do
        assert_routing({:path => @path + '/1/delete_annotation_text',
                              :method => :delete},
                             {:controller => @controller,
                              :action => 'delete_annotation_text',
                              :id => '1',
                              :assignment_id => '1',
                              :locale => 'en'})
        end
       should "route GET add_annotation_text properly" do
        assert_routing({:path => @path + '/1/add_annotation_text',
                              :method => :get},
                             {:controller => @controller,
                              :action => 'add_annotation_text',
                              :id => '1',
                              :assignment_id => '1',
                              :locale => 'en'})
        end
       should "route POST add_annotation_text properly" do
        assert_routing({:path => @path + '/1/add_annotation_text',
                              :method => :post},
                             {:controller => @controller,
                              :action => 'add_annotation_text',
                              :id => '1',
                              :assignment_id => '1',
                              :locale => 'en'})
        end
       should "route PUT update_annotation properly" do
        assert_routing({:path => @path + '/1/update_annotation',
                              :method => :put},
                             {:controller => @controller,
                              :action => 'update_annotation',
                              :id => '1',
                              :assignment_id => '1',
                              :locale => 'en'})
        end
      end # end assignments annotation_categories member route tests
      context "collection" do
        should "route GET add_annotation_category properly" do
          assert_routing({:path => @path + '/add_annotation_category',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'add_annotation_category',
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
        should "route GET delete_annotation_category properly" do
          assert_routing({:path => @path + '/delete_annotation_category',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'delete_annotation_category',
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
        should "route POST yml_upload properly" do
          assert_routing({:path => @path + '/yml_upload',
                          :method => :post},
                         {:controller => @controller,
                          :action => 'yml_upload',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route POST add_annotation_category properly" do
          assert_routing({:path => @path + '/add_annotation_category',
                          :method => :post},
                         {:controller => @controller,
                          :action => 'add_annotation_category',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route POST update_annotation_category properly" do
          assert_routing({:path => @path + '/update_annotation_category',
                          :method => :post},
                         {:controller => @controller,
                          :action => 'update_annotation_category',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route GET add_annotation_text properly" do
          assert_routing({:path => @path + '/add_annotation_text',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'add_annotation_text',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route POST delete_annotation_text properly" do
          assert_routing({:path => @path + '/delete_annotation_text',
                          :method => :post},
                         {:controller => @controller,
                          :action => 'delete_annotation_text',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
        should "route POST update_annotation properly" do
          assert_routing({:path => @path + '/update_annotation',
                          :method => :post},
                         {:controller => @controller,
                          :action => 'update_annotation',
                          :assignment_id => '1',
                          :locale => 'en'})
        end
      end # end assignment annotation categories collection route tests
    end # end assignment annotation_categories route tests
  end # end assignments route tests
  context "grade_entry_forms" do
    setup do
      @path = "en/grade_entry_forms"
      @controller = "grade_entry_forms"
    end
    context "collection" do
      should "route GET student_interface properly" do
        assert_routing({:path => @path + '/student_interface',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'student_interface',
                          :locale => 'en'})
        end
     end # end grade_entry_forms collection route tests
    context "member" do
      should "route GET grades properly" do
        assert_routing({:path => @path + '/1/grades',
                        :method => :get},
                       {:controller => @controller,
                        :action => 'grades',
                        :id => '1',
                        :locale => 'en'})
      end
      should "route GET g_table_paginate properly" do
        assert_routing({:path => @path + '/1/g_table_paginate',
                        :method => :get},
                       {:controller => @controller,
                        :action => 'g_table_paginate',
                        :id => '1',
                        :locale => 'en'})
      end
      should "route GET csv_download properly" do
        assert_routing({:path => @path + '/1/csv_download',
                        :method => :get},
                       {:controller => @controller,
                        :action => 'csv_download',
                        :id => '1',
                        :locale => 'en'})
      end
      should "route POST csv_upload properly" do
        assert_routing({:path => @path + '/1/csv_upload',
                        :method => :post},
                       {:controller => @controller,
                        :action => 'csv_upload',
                        :id => '1',
                        :locale => 'en'})
      end
      should "route POST update_grade properly" do
        assert_routing({:path => @path + '/1/update_grade',
                        :method => :post},
                       {:controller => @controller,
                        :action => 'update_grade',
                        :id => '1',
                        :locale => 'en'})
      end
      should "route POST update_grade_entry_students properly" do
        assert_routing({:path => @path + '/1/update_grade_entry_students',
                        :method => :post},
                       {:controller => @controller,
                        :action => 'update_grade_entry_students',
                        :id => '1',
                        :locale => 'en'})
      end
     # should "route GET student_interface properly" do
     #   assert_routing({:path => @path + '/1/student_interface',
     #                   :method => :get},
     #                  {:controller => @controller,
     #                   :action => 'student_interface',
     #                   :id => '1',
     #                   :locale => 'en'})
     # end
    end # end grade_entry_forms member route tests
  end # end grade_entry_forms route tests
  context "notes" do
    setup do
      @path = "/en/notes"
      @controller = "notes"
    end
    context "collection" do
      should "route POST add_note properly" do
        assert_routing({:path => @path + '/add_note',
                          :method => :post},
                         {:controller => @controller,
                          :action => 'add_note',
                          :locale => 'en'})
      end
      should "route POST noteable_object_selector properly" do
        assert_routing({:path => @path + '/noteable_object_selector',
                          :method => :post},
                         {:controller => @controller,
                          :action => 'noteable_object_selector',
                          :locale => 'en'})
      end
      should "route GET new_update_groupings properly" do
        assert_routing({:path => @path + '/new_update_groupings',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'new_update_groupings',
                          :locale => 'en'})
      end
      should "route POST new_update_groupings properly" do
        assert_routing({:path => @path + '/new_update_groupings',
                          :method => :post},
                         {:controller => @controller,
                          :action => 'new_update_groupings',
                          :locale => 'en'})
      end
    end # end notes collection route tests
    context "member" do
      should "route GET student_interface properly" do
        assert_routing({:path => @path + '/1/student_interface',
                        :method => :get},
                       {:controller => @controller,
                        :action => 'student_interface',
                        :id => '1',
                        :locale => 'en'})
      end
      should "route GET notes_dialog properly" do
        assert_routing({:path => @path + '/1/notes_dialog',
                        :method => :get},
                       {:controller => @controller,
                        :action => 'notes_dialog',
                        :id => '1',
                        :locale => 'en'})
      end
      should "route POST grades properly" do
        assert_routing({:path => @path + '/1/grades',
                        :method => :post},
                       {:controller => @controller,
                        :action => 'grades',
                        :id => '1',
                        :locale => 'en'})
      end
    end # end notes member route tests
  end # end notes route tests
  context "annotation collection" do
    setup do
     @path = "/en/annotations"
     @controller = "annotations"
    end
    should "route POST add_existing_annotation properly" do
      assert_routing({:path => @path + '/add_existing_annotation',
                          :method => :post},
                         {:controller => @controller,
                          :action => 'add_existing_annotation',
                          :locale => 'en'})
    end
    should "route PUT update_annotation properly" do
      assert_routing({:path => @path + '/update_annotation',
                          :method => :put},
                         {:controller => @controller,
                          :action => 'update_annotation',
                          :locale => 'en'})
    end
    should "route POST update_comment properly" do
     assert_routing({:path => @path + '/update_comment',
                          :method => :post},
                         {:controller => @controller,
                          :action => 'update_comment',
                          :locale => 'en'})
    end
    should "route DELETE destroy properly" do
     assert_routing({:path => @path,
                          :method => :delete},
                         {:controller => @controller,
                          :action => 'destroy',
                          :locale => 'en'})
    end
  end # end annotation route tests
  context "students collection" do
    setup do
      @path = "/en/students"
      @controller = "students"
    end
    should "route POST bulk_modify properly" do
     assert_routing({:path => @path + '/bulk_modify',
                          :method => :post},
                         {:controller => @controller,
                          :action => 'bulk_modify',
                          :locale => 'en'})
    end
    should "route POST populate properly" do
     assert_routing({:path => @path + '/populate',
                          :method => :post},
                         {:controller => @controller,
                          :action => 'populate',
                          :locale => 'en'})
    end
    should "route GET manage properly" do
     assert_routing({:path => @path + '/manage',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'manage',
                          :locale => 'en'})
    end
    should "route GET add_new_section properly" do
     assert_routing({:path => @path + '/add_new_section',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'add_new_section',
                          :locale => 'en'})
    end
    should "route GET download_student_list properly" do
     assert_routing({:path => @path + '/download_student_list',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'download_student_list',
                          :locale => 'en'})
    end
    should "route POST upload_student_list properly" do
     assert_routing({:path => @path + '/upload_student_list',
                          :method => :post},
                         {:controller => @controller,
                          :action => 'upload_student_list',
                          :locale => 'en'})
    end
  end # end students collection route tests
  context "tas collection" do
    setup do
      @path = "/en/tas"
      @controller = "tas"
    end
    should "route POST populate properly" do
     assert_routing({:path => @path + '/populate',
                          :method => :post},
                         {:controller => @controller,
                          :action => 'populate',
                          :locale => 'en'})
    end
    should "route POST upload_ta_list properly" do
     assert_routing({:path => @path + '/upload_ta_list',
                          :method => :post},
                         {:controller => @controller,
                          :action => 'upload_ta_list',
                          :locale => 'en'})
    end
    should "route GET download_ta_list properly" do
     assert_routing({:path => @path + '/download_ta_list',
                          :method => :get},
                         {:controller => @controller,
                          :action => 'download_ta_list',
                          :locale => 'en'})
    end
  end # end tas collection route tests
  context "main" do
    setup do
      @path = "/en/main"
      @controller = "main"
    end
    context "collection" do
      should "route GET logout properly" do
       assert_routing({:path => @path + '/logout',
                            :method => :post},
                           {:controller => @controller,
                            :action => 'logout',
                            :locale => 'en'})
      end
      should "route GET about properly" do
       assert_routing({:path => @path + '/about',
                            :method => :post},
                           {:controller => @controller,
                            :action => 'about',
                            :locale => 'en'})
      end
      should "route POST login_as properly" do
       assert_routing({:path => @path + '/login_as',
                            :method => :post},
                           {:controller => @controller,
                            :action => 'login_as',
                            :locale => 'en'})
      end
      should "route GET role_switch properly" do
       assert_routing({:path => @path + '/about',
                            :method => :post},
                           {:controller => @controller,
                            :action => 'about',
                            :locale => 'en'})
      end
      should "route GET clear_role_switch_session properly" do
       assert_routing({:path => @path + '/about',
                            :method => :post},
                           {:controller => @controller,
                            :action => 'about',
                            :locale => 'en'})
      end
      should "route POST reset_api_key properly" do
       assert_routing({:path => @path + '/reset_api_key',
                            :method => :post},
                           {:controller => @controller,
                            :action => 'reset_api_key',
                            :locale => 'en'})
      end
    end # end main collection route tests
    should "route GET index properly" do
       assert_routing({:path => @path,
                            :method => :get},
                           {:controller => @controller,
                            :action => 'index',
                            :locale => 'en'})
    end
    should "route GET about properly" do
       assert_routing({:path => @path + "/about",
                            :method => :get},
                           {:controller => @controller,
                            :action => 'about',
                            :locale => 'en'})
    end
    should "route GET logout properly" do
       assert_routing({:path => @path + "/logout",
                            :method => :get},
                           {:controller => @controller,
                            :action => 'logout',
                            :locale => 'en'})
    end
  end # end main route tests
end # end route tests