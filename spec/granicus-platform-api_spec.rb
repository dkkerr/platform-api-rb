require 'helper'

GRANICUS_SITE = ENV['SITE']
GRANICUS_LOGIN = ENV['USERNAME']
GRANICUS_PASSWORD = ENV['PASSWORD']
CAMERA_ID = 3
FOLDER_ID = 7
SERVER_ID = 1
EVENT_ID = 30
EVENT_META_ID = 1775
CLIP_ID = 246
CLIP_UID = '00000000-0000-0000-0000-000000000000'
CLIP_META_ID = 574
FOREIGN_ID = 1

client = GranicusPlatformAPI::Client.new GRANICUS_SITE, GRANICUS_LOGIN, GRANICUS_PASSWORD 

# The projects method
describe GranicusPlatformAPI, "::Client.login" do
  it "should log me in" do
    logon = client.get_current_user_logon
    logon.should == GRANICUS_LOGIN
  end
end

describe GranicusPlatformAPI, "::Client.get_cameras" do
  it "should get my cameras" do
    cameras = client.get_cameras
    found = cameras.find {|c| c.id == CAMERA_ID } 
    found.should_not == nil
  end
end

describe GranicusPlatformAPI, "::Client.get_camera" do
  it "should get the requested camera" do
    camera = client.get_camera CAMERA_ID
    camera.id.should == CAMERA_ID
  end
end

describe GranicusPlatformAPI, "::Client.get_events" do
  it "should get my events" do
    events = client.get_events
    found = events.find {|e| e.id == EVENT_ID } 
    found.should_not == nil
  end
end

describe GranicusPlatformAPI, "::Client.get_event" do
  it "should get the requested event" do
    event = client.get_event EVENT_ID
    event.id.should == EVENT_ID
  end
end

describe GranicusPlatformAPI, "::Client.get_folders" do
  it "should get my folders" do
    folders = client.get_folders
    folders[0].id.should == FOLDER_ID
  end
end

describe GranicusPlatformAPI, "::Client.get_clips" do
  it "should get clips from the given folder" do
    clips = client.get_clips FOLDER_ID
    clips.each do |clip|
      clip.folder_id.should == FOLDER_ID
    end
  end
end

describe GranicusPlatformAPI, "::Client.get_clips_by_foreign_id" do
  it "should get all clips with matching foreign id" do
    clips = client.get_clips_by_foreign_id FOREIGN_ID
    clips.each do |clip|
      clip.foreign_id.should == FOREIGN_ID
    end
  end
end

describe GranicusPlatformAPI, "::Client.get_clip" do
  it "should get the requested clip" do
    clip = client.get_clip CLIP_ID
    clip.id.should == CLIP_ID
  end
end

describe GranicusPlatformAPI, "::Client.get_clip_by_uid" do
  it "should get the requested clip" do
    clip = client.get_clip_by_uid CLIP_UID
    clip.id.should == CLIP_UID
  end
end

describe GranicusPlatformAPI, "::Client.get_event_meta_data" do
  it "should get my event meta data" do
    metadata = client.get_event_meta_data EVENT_ID
    found = metadata.find {|m| m.id == EVENT_META_ID } 
    found.should_not == nil
  end
end

describe GranicusPlatformAPI, "::Client.get_clip_meta_data" do
  it "should get my clip meta data" do
    metadata = client.get_clip_meta_data CLIP_ID
    found = metadata.find {|m| m.id == CLIP_META_ID } 
    found.should_not == nil
  end
end

describe GranicusPlatformAPI, "::Client.get_servers" do
  it "should get my servers" do
    servers = client.get_servers
    puts servers
    servers[0].id.should == SERVER_ID
  end
end

describe GranicusPlatformAPI, "::Client.logout" do
  it "should log me out" do
    value = client.logout
  end
end