<a name="About Glaip"></a>

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/othneildrew/Best-README-Template">
    <img src="Sources/logo.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">Glaip - an easy iOS Web3 Connector</h3>

  <p align="center">
    A Web3 tool for your native iOS app
    <br />
    <br />
    <a href="https://github.com/maurovz/GlaipDemo">View Demo</a>
    ·
    <a href="https://github.com/maurovz/Glaip/issues">Report Bug</a>
    ·
    <a href="https://github.com/maurovz/Glaip/issues">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

[![Product Name Screen Shot][product-demo]]

The purpuse of Glaip is to make Web3 integrations easier in your native mobile apps. Glaip takes care of all the wallet configuration so you can focus on building.

I created this project because I spent a lot of time trying to integrate my native apps into Web3 and found there was little documentation and tools to solve this problem.

Some of the goals for this project are:
* Crosschain support
* Non-custodial wallet support
* Crosschain Web3 API   

To make this project great, I will need community feedback. Please feel free to post an issue or reach out on Twitter!


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started

For this current versión we only support MetaMask login using the WalletConnectSwift framework.

### Installation

Add this package to your porject (In Xcode: Add Packages -> Enter the following url in the search fill, Select Glaip)
   ```sh
   https://github.com/maurovz/Glaip.git
   ```


<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

For a complete login flow see the [Example Project](https://github.com/maurovz/GlaipDemo) 

You can initiate Glaip in SwiftUI as follow:

 ```sh
    @ObservedObject private var glaip = Glaip(
      title: "Glaip Demo App",
      description: "Demo app to demonstrate Web3 login",
      supportedWallets: [.WalletConnect])
   
   ```

Adding the connect event to a SwiftUI button:

 ```sh
Button("Connect to MetaMask") {
    self.glaip.connect()
}
   
   ```
   

<!-- ROADMAP -->
## Roadmap

- [x] Example project for SwiftUI
- [ ] What the community requests
- [ ] Example project for UIKit
- [ ] MagicLink submodule
- [ ] Non-custorial support

See the [open issues](https://github.com/maurovz/Glaip/issues) to see if your problem is listed or feel free to create one.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->
## License

Distributed under the Apache 2.0 License.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTACT -->
## Contact

Mauricio Vazquez - [@_mau_vaz](https://twitter.com/_mau_vaz)

Project Link: [https://github.com/maurovz/Glaip](https://github.com/maurovz/Glaip)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [WalletConnectSwift](https://walletconnect.com/)
* [Freepik](https://freepik.com/)


<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/othneildrew/Best-README-Template.svg?style=for-the-badge
[contributors-url]: https://github.com/othneildrew/Best-README-Template/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/othneildrew/Best-README-Template.svg?style=for-the-badge
[forks-url]: https://github.com/othneildrew/Best-README-Template/network/members
[stars-shield]: https://img.shields.io/github/stars/othneildrew/Best-README-Template.svg?style=for-the-badge
[stars-url]: https://github.com/othneildrew/Best-README-Template/stargazers
[issues-shield]: https://img.shields.io/github/issues/othneildrew/Best-README-Template.svg?style=for-the-badge
[issues-url]: https://github.com/othneildrew/Best-README-Template/issues
[license-shield]: https://img.shields.io/github/license/othneildrew/Best-README-Template.svg?style=for-the-badge
[license-url]: https://github.com/othneildrew/Best-README-Template/blob/master/LICENSE.txt
[twitter-shield]: https://img.shields.io/twitter/follow/glaip?style=for-the-badge
[linkedin-url]: https://linkedin.com/in/othneildrew
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/othneildrew
[product-demo]: https://i.imgur.com/tRtGx4X.gif
