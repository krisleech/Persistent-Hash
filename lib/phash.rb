class Database < Hash
	def initialize
		super
		@filename = self.class.to_s + '.yml'
		File.open(@filename, 'w') { |f| f.write({}.to_yaml) } unless File.exists? @filename		
  	self.merge!(YAML::load(File.read(@filename)))
	end
	
	def filename
	  @filename
  end
		
	def save
	  File.open(@filename, 'w') { |f| f.write(self.to_yaml) }
  end
end  
