##########################GO-LICENSE-START################################
# Copyright 2015 ThoughtWorks, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
##########################GO-LICENSE-END##################################

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Api::ServerStateController do
  before :each do
    @system_environment = double('system_environment')
    controller.stub(:system_environment).and_return(@system_environment)
  end

  it 'should answer to /api/state/status' do
    expect(get: '/api/state/status').to route_to(action: 'status', controller: 'api/server_state', no_layout: true)
  end

  it 'should answer to /api/state/active' do
    expect(post: '/api/state/active').to route_to(action: 'to_active', controller: 'api/server_state', no_layout: true)
  end

  it 'should answer to /api/state/passive' do
    expect(post: '/api/state/passive').to route_to(action: 'to_passive', controller: 'api/server_state', no_layout: true)
  end

  it 'should return server state status as active' do
    @system_environment.should_receive(:isServerActive).and_return(true)
    get :status, no_layout: true
    expect(response.body).to eq('active')
  end

  it 'should return server state status as passive' do
    @system_environment.should_receive(:isServerActive).and_return(false)
    get :status, no_layout: true
    expect(response.body).to eq('passive')
  end

  it 'should update server state to passive' do
    @system_environment.should_receive(:switchToPassiveState)
    post :to_passive, no_layout: true
    expect(response.body).to eq('passive')
  end

  it 'should update server state to active' do
    @system_environment.should_receive(:switchToActiveState)
    post :to_active, no_layout: true
    expect(response.body).to eq('active')
  end
end
