import React from 'react';
import {Gyroscope,} from 'expo';
import {MapView} from 'expo';

export default class MapPermission extends React.Component {
  render() {
    return (
      <MapView
        style={{ flex:1 }}
        initialRegion={{
          latitude: 37.78825,
          longitude: -122.4324
          latitudeDelta: 0.0922,
          longitudeDelta: 0.0421,
        }}
      />
    );
  }
}
