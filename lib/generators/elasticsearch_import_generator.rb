class ElasticsearchImportGenerator < Rails::Generators::Base
  def import_model_to_elasticsearch_index
    Rails.logger.info 'Start import data form DB to elasticsearch'
    Rails.logger.info 'Article...'
    Article.import
    Rails.logger.info 'Finished import data to elasticsearch'
  end
end
