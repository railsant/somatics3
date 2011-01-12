require 'rails/generators/named_base'
require 'rails/generators/migration'

module Somatics
  module Generators
    module Helper
      def self.included(base)
        base.send(:extend, ClassMethods)
        base.send(:include, InstanceMethods)
      end
      
      module ClassMethods
        private
        
        def uses_local_templates
          extend Somatics::Generators::TemplatePath
        end
        
        def namespaced
          class_option :namespace, :banner => "NAME", :type => :string, :required => false, :default => "admin", :desc => "namespace for the controller"
        end
      end
      
      module InstanceMethods
        private
      end
    end
    
    module TemplatePath
      def source_root
        @_somaitcs_source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'somatics', generator_name, 'templates'))
      end
    end
  end
end

Rails::Generators::NamedBase.send(:include, Somatics::Generators::Helper)