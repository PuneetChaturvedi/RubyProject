require 'nokogiri'
require 'net/sftp'
require 'archive/zip'

class ProcessWorkHorseResponse
  LOCAL_DIR = File.join(File.dirname(__FILE__), '/Downloads/PREQ/').freeze
  FILE_EXTN = '*.xml'.freeze
  WORKHORSE_TO_SALSIFY = '/SalsifyImportToWH'.freeze
  ARCHIVE = [LOCAL_DIR, 'PhotoRequests_', '.zip']

  ## This method download the files from workhorse server to salsify server.

  def readRemoteXML
    #sftp= Net::SFTP.start('belkuat.workhorsegroup.us', 'BLKUATUSER', :password => '5ada833014a4c092012ed3f8f82aa0c1')
    Net::SFTP.start('belkuat.workhorsegroup.us', 'BLKUATUSER', :password => '5ada833014a4c092012ed3f8f82aa0c1') do |sftp|
      sftp.dir.glob(WORKHORSE_TO_SALSIFY, FILE_EXTN).each do |file|
        #puts file.name
        sftp.download(File.join(WORKHORSE_TO_SALSIFY, '/', file.name), File.join(LOCAL_DIR, file.name))
      end
    end
  end

  ## This method parse the xml on salsify serverr, placed by "readRemoteXML"  method.
  def parsePhotoRequestReponseXMl
    Dir.glob(File.join(LOCAL_DIR, FILE_EXTN)).each do |file|
      doc = Nokogiri::XML.parse(File.open(file)) { |xml| xml.noblanks }
      project = doc.root.child
      project.children.each { |shotGrp|
        if shotGrp.name == 'ShotGroup'
          puts shotGrp.name #puts node.children.first.name
          puts 'SalsifyID: ' + shotGrp['SalsifyID']
          puts 'ShotGroupStatus: ' + shotGrp['ShotGroupStatus']
          puts '------------'
          shotGrp.children.each { |image|
            puts image.name
            puts image.values
            puts '-----------'
            image.children.each { |sample|
              puts sample.name
              puts sample.values
              puts '##########'
            }
          }
        end
      }
    end
  end

  def parsePhotoRequestReponseXMl2
    Dir.glob(File.join(LOCAL_DIR, FILE_EXTN)).each do |file|
      doc = Nokogiri::XML.parse(File.open(file)) { |xml| xml.noblanks }
      project = doc.root.child
      project.children.each { |shotGrp|
        if shotGrp.name == 'ShotGroup'
          puts shotGrp.name #puts node.children.first.name
          puts 'SalsifyID: ' + shotGrp['SalsifyID']
          puts 'ShotGroupStatus: ' + shotGrp['ShotGroupStatus']
          puts '------------'
          shotGrp.children.each { |image|
            puts image.name
            puts image.values
            puts '-----------'
            image.children.each { |sample|
              puts sample.name
              puts sample.values
              puts '##########'
            }
          }
        end
      }
    end
  end

  ## This method archive the photo sample request xml files.
  def zip_files
    time = Time.now.strftime('%Y-%d-%m_%H-%M-%S')
    Archive::Zip.archive(File.join(ARCHIVE[0], ARCHIVE[1], time, ARCHIVE[2]), File.join(LOCAL_DIR, '.'))
    Dir.glob(File.join(LOCAL_DIR, FILE_EXTN)).each { |file| File.delete(file) }
  end

  def handle_files
    puts 'files'
  end

  ## This is the main method of the class, it calls all the utility methods of the calls in a sequential order
  def processFiles
    readRemoteXML
    parsePhotoRequestReponseXMl2
    handle_files
    zip_files
  end
end

ProcessWorkHorseResponse.new.processFiles
