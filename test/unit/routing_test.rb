require File.join(File.dirname(__FILE__), '..', 'test_helper')
require File.join(File.dirname(__FILE__), '..', 'blueprints', 'helper')

require 'test_helper'
require 'shoulda'
require 'machinist'
require 'mocha'

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
      end      
    end
    context "submission_downloads resource" do
      
    end
    context "users resource" do
      
    end
    context "main_api resource" do
      
    end
  end

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
   end
   
end
