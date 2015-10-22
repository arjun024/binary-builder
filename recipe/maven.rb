require_relative 'base'

class MavenRecipe < BaseRecipe
  def url
    "http://www.us.apache.org/dist/maven/maven-3/#{version}/source/apache-maven-#{version}-src.tar.gz"
  end

  def cook
    download unless downloaded?
    extract
    install
  end

  def install
    FileUtils.mkdir_p(path)
    execute("install", ['cp', '-r', '.', path])
  end
end


