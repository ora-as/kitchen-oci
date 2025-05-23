# frozen_string_literal: true

#
# Author:: Justin Steele (<justin.steele@oracle.com>)
#
# Copyright (C) 2024, Stephen Pearson
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

RSpec.shared_context "proxy", :proxy do |rspec|
  before do
    stub_const("ENV", ENV.to_hash.merge({ "http_proxy" => "http://myfakeproxy.com", "no_proxy" => ".myfakedomain.com" }))
    allow(OCI::ApiClientProxySettings).to receive(:new).with("myfakeproxy.com", 80).and_return(proxy_settings)
  end
  let(:proxy_settings) { OCI::ApiClientProxySettings.new("myfakeproxy.com", 80) }
end
