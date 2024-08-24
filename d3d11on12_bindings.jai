//
// This file was auto-generated using the following command:
//
// jai generate.jai
//
//  --------------------
// | D3D11ON12 BINDINGS |
//  --------------------



PFN_D3D11ON12_CREATE_DEVICE :: #type (unknown0: *IUnknown, unknown1: u32, unknown2: *D3D_FEATURE_LEVEL, FeatureLevels: u32, unknown3: **IUnknown, NumQueues: u32, unknown4: u32, unknown5: **ID3D11Device, unknown6: **ID3D11DeviceContext, unknown7: *D3D_FEATURE_LEVEL) -> HRESULT #c_call;

D3D11_RESOURCE_FLAGS :: struct {
    BindFlags:           u32;
    MiscFlags:           u32;
    CPUAccessFlags:      u32;
    StructureByteStride: u32;
}


ID3D11On12Device_UUID :: "85611e73-70a9-490e-9614-a9e302777904";
ID3D11On12Device :: struct {
    #as using iunknown: IUnknown;
    #place iunknown; id3d11on12device_vtable: *ID3D11On12Device_VTable;
}
ID3D11On12Device_VTable :: struct #type_info_none {
    using iunknown: IUnknown_VTable;
    CreateWrappedResource: (this: *ID3D11On12Device, pResource12: *IUnknown, pFlags11: *D3D11_RESOURCE_FLAGS, InState: D3D12_RESOURCE_STATES, OutState: D3D12_RESOURCE_STATES, riid: *IID, ppResource11: **void) -> HRESULT #cpp_method;

    ReleaseWrappedResources: (this: *ID3D11On12Device, ppResources: **ID3D11Resource, NumResources: u32) -> void #cpp_method;

    AcquireWrappedResources: (this: *ID3D11On12Device, ppResources: **ID3D11Resource, NumResources: u32) -> void #cpp_method;
}

ID3D11On12Device_CreateWrappedResource :: inline (this: *ID3D11On12Device, pResource12: *IUnknown, pFlags11: *D3D11_RESOURCE_FLAGS, InState: D3D12_RESOURCE_STATES, OutState: D3D12_RESOURCE_STATES, riid: *IID, ppResource11: **void) -> HRESULT { return this.id3d11on12device_vtable.CreateWrappedResource(this, pResource12, pFlags11, InState, OutState, riid, ppResource11); }

ID3D11On12Device_ReleaseWrappedResources :: inline (this: *ID3D11On12Device, ppResources: **ID3D11Resource, NumResources: u32) { this.id3d11on12device_vtable.ReleaseWrappedResources(this, ppResources, NumResources); }

ID3D11On12Device_AcquireWrappedResources :: inline (this: *ID3D11On12Device, ppResources: **ID3D11Resource, NumResources: u32) { this.id3d11on12device_vtable.AcquireWrappedResources(this, ppResources, NumResources); }

vtable :: (obj: *ID3D11On12Device) -> *ID3D11On12Device_VTable { return obj.id3d11on12device_vtable; }



ID3D11On12Device1_UUID :: "bdb64df4-ea2f-4c70-b861-aaab1258bb5d";
ID3D11On12Device1 :: struct {
    #as using id3d11on12device: ID3D11On12Device;
    #place id3d11on12device; id3d11on12device1_vtable: *ID3D11On12Device1_VTable;
}
ID3D11On12Device1_VTable :: struct #type_info_none {
    using id3d11on12device: ID3D11On12Device_VTable;
    GetD3D12Device: (this: *ID3D11On12Device1, riid: *IID, ppvDevice: **void) -> HRESULT #cpp_method;
}
ID3D11On12Device1_GetD3D12Device :: inline (this: *ID3D11On12Device1, riid: *IID, ppvDevice: **void) -> HRESULT { return this.id3d11on12device1_vtable.GetD3D12Device(this, riid, ppvDevice); }

vtable :: (obj: *ID3D11On12Device1) -> *ID3D11On12Device1_VTable { return obj.id3d11on12device1_vtable; }



ID3D11On12Device2_UUID :: "dc90f331-4740-43fa-866e-67f12cb58223";
ID3D11On12Device2 :: struct {
    #as using id3d11on12device1: ID3D11On12Device1;
    #place id3d11on12device1; id3d11on12device2_vtable: *ID3D11On12Device2_VTable;
}
ID3D11On12Device2_VTable :: struct #type_info_none {
    using id3d11on12device1: ID3D11On12Device1_VTable;
    UnwrapUnderlyingResource: (this: *ID3D11On12Device2, pResource11: *ID3D11Resource, pCommandQueue: *ID3D12CommandQueue, riid: *IID, ppvResource12: **void) -> HRESULT #cpp_method;

    ReturnUnderlyingResource: (this: *ID3D11On12Device2, pResource11: *ID3D11Resource, NumSync: u32, pSignalValues: *u64, ppFences: **ID3D12Fence) -> HRESULT #cpp_method;
}

ID3D11On12Device2_UnwrapUnderlyingResource :: inline (this: *ID3D11On12Device2, pResource11: *ID3D11Resource, pCommandQueue: *ID3D12CommandQueue, riid: *IID, ppvResource12: **void) -> HRESULT { return this.id3d11on12device2_vtable.UnwrapUnderlyingResource(this, pResource11, pCommandQueue, riid, ppvResource12); }

ID3D11On12Device2_ReturnUnderlyingResource :: inline (this: *ID3D11On12Device2, pResource11: *ID3D11Resource, NumSync: u32, pSignalValues: *u64, ppFences: **ID3D12Fence) -> HRESULT { return this.id3d11on12device2_vtable.ReturnUnderlyingResource(this, pResource11, NumSync, pSignalValues, ppFences); }

vtable :: (obj: *ID3D11On12Device2) -> *ID3D11On12Device2_VTable { return obj.id3d11on12device2_vtable; }


#scope_file

#import "Basic"; // For assert

d3d11on12 :: #library,system "d3d11on12";

#run {
    {
        instance: D3D11_RESOURCE_FLAGS;
        assert(((cast(*void)(*instance.BindFlags)) - cast(*void)(*instance)) == 0, "D3D11_RESOURCE_FLAGS.BindFlags has unexpected offset % instead of 0", ((cast(*void)(*instance.BindFlags)) - cast(*void)(*instance)));
        assert(size_of(type_of(D3D11_RESOURCE_FLAGS.BindFlags)) == 4, "D3D11_RESOURCE_FLAGS.BindFlags has unexpected size % instead of 4", size_of(type_of(D3D11_RESOURCE_FLAGS.BindFlags)));
        assert(((cast(*void)(*instance.MiscFlags)) - cast(*void)(*instance)) == 4, "D3D11_RESOURCE_FLAGS.MiscFlags has unexpected offset % instead of 4", ((cast(*void)(*instance.MiscFlags)) - cast(*void)(*instance)));
        assert(size_of(type_of(D3D11_RESOURCE_FLAGS.MiscFlags)) == 4, "D3D11_RESOURCE_FLAGS.MiscFlags has unexpected size % instead of 4", size_of(type_of(D3D11_RESOURCE_FLAGS.MiscFlags)));
        assert(((cast(*void)(*instance.CPUAccessFlags)) - cast(*void)(*instance)) == 8, "D3D11_RESOURCE_FLAGS.CPUAccessFlags has unexpected offset % instead of 8", ((cast(*void)(*instance.CPUAccessFlags)) - cast(*void)(*instance)));
        assert(size_of(type_of(D3D11_RESOURCE_FLAGS.CPUAccessFlags)) == 4, "D3D11_RESOURCE_FLAGS.CPUAccessFlags has unexpected size % instead of 4", size_of(type_of(D3D11_RESOURCE_FLAGS.CPUAccessFlags)));
        assert(((cast(*void)(*instance.StructureByteStride)) - cast(*void)(*instance)) == 12, "D3D11_RESOURCE_FLAGS.StructureByteStride has unexpected offset % instead of 12", ((cast(*void)(*instance.StructureByteStride)) - cast(*void)(*instance)));
        assert(size_of(type_of(D3D11_RESOURCE_FLAGS.StructureByteStride)) == 4, "D3D11_RESOURCE_FLAGS.StructureByteStride has unexpected size % instead of 4", size_of(type_of(D3D11_RESOURCE_FLAGS.StructureByteStride)));
        assert(size_of(D3D11_RESOURCE_FLAGS) == 16, "D3D11_RESOURCE_FLAGS has size % instead of 16", size_of(D3D11_RESOURCE_FLAGS));
    }

    assert(size_of(ID3D11On12Device) == 8, "ID3D11On12Device has size % instead of 8", size_of(ID3D11On12Device));

    assert(size_of(ID3D11On12Device1) == 8, "ID3D11On12Device1 has size % instead of 8", size_of(ID3D11On12Device1));

    assert(size_of(ID3D11On12Device2) == 8, "ID3D11On12Device2 has size % instead of 8", size_of(ID3D11On12Device2));
}

#import "Windows";
#import "d3d11";
#import "d3d12";
// #import "dxgi";
