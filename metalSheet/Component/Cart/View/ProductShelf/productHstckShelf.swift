

import SwiftUI
 struct productHstckShelf: View {
	 @StateObject var viewModel: CartViewModel = CartViewModel()
	 @EnvironmentObject var description: DescriptionViewModel
	 @State private var selectedProductId: String?
	 @State private var selectedIndex: Int = 0 // Track selected index
	 @State private var scrollToSelected = false // Flag to trigger scroll to selected
	 
	 var body: some View {
		 ZStack{
			 let isiPad = UIDevice.current.userInterfaceIdiom == .pad
			 if !viewModel.cartModel.isEmpty { // Check if cartModel is not empty
				 ScrollView(.horizontal, showsIndicators: false){
					 ScrollViewReader { scrollView in
						 LazyHStack(alignment: .center, spacing: CGFloat(15)){
							 ForEach(0..<3) { index in
								 let itemIndex = index % 3
								 
								 productView(for: itemIndex)
									 
								
							 }
							 
						 }
					
						 .padding(.leading,20)
						// .padding(.leading, UIScreen.main.bounds.width / 5)
			 
						 .onChange(of: scrollToSelected) { scrollToSelected in
							 if scrollToSelected {
								 scrollView.scrollTo(selectedIndex, anchor: .center)
								 DispatchQueue.main.async {
									 self.scrollToSelected = false
								 }
							 }
						 }
					 }
					
				 }
				
				
			 } else {
				 ProgressView()
				 Text("กำลังโหลด...")
					 .font(.subheadline)
					 .foregroundColor(Color.white.opacity(0.5))
			 }
		 }
	 }
	 
	 func productView(for index: Int) -> some View {
		 let cartModel = viewModel.cartModel[index]
		 
		 return NavigationLink(
			 destination: DescriptionView(viewmodel: cartModel, viewModel: description),
			 tag: cartModel.id ?? "",
			 selection: $selectedProductId
		 ) {
			 productHStackView(viewmodel: cartModel)
				 .frame(maxWidth: .infinity)
				 .onTapGesture {
					 if let productId = cartModel.id {
						 description.productid = productId
						 description.isDataFetched = false
						 description.clearCacheIfNeeded()
						 selectedProductId = productId
					 }
				 }
				 .onAppear { // Detect when this view becomes visible
					 selectedIndex = index
					 //print(selectedIndex)// Update selected index when the view becomes visible
				 }
			 
		 }
	 }

	
 }
 //#Preview {
	// productHstckShelf()
 //}
/*import SwiftUI
 struct productHstckShelf: View {
	 @StateObject var viewModel: CartViewModel = CartViewModel()
	 @EnvironmentObject var description: DescriptionViewModel
	 @State private var selectedProductId: String?
	 @State private var selectedIndex: Int = 0 // Track selected index
	 @State private var scrollToSelected = false // Flag to trigger scroll to selected
	 
	 var body: some View {
		 ZStack{
			 if !viewModel.cartModel.isEmpty { // Check if cartModel is not empty
				 BackgroundView(imageURL: viewModel.cartModel.indices.contains(selectedIndex) ? viewModel.cartModel[selectedIndex].productImage : "")
					 .ignoresSafeArea()
					 .cornerRadius(5)
				 
				 ScrollView(.horizontal, showsIndicators: true){
					 ScrollViewReader { scrollView in
						 LazyHStack(alignment: .center, spacing: CGFloat(120)){
							 ForEach(0..<3) { index in
								 let itemIndex = index % 3
								 
								 productView(for: itemIndex)
								
							 }
						 }
					
						 .padding(.leading, UIScreen.main.bounds.width / 5)
			 
						 .onChange(of: scrollToSelected) { scrollToSelected in
							 if scrollToSelected {
								 scrollView.scrollTo(selectedIndex, anchor: .center)
								 DispatchQueue.main.async {
									 self.scrollToSelected = false
								 }
							 }
						 }
					 }
					
				 }
				 
			 } else {
				 Text("No data available") // Display a message if cartModel is empty
			 }
		 }
	 }
	 
	 func productView(for index: Int) -> some View {
		 let cartModel = viewModel.cartModel[index]
		 
		 return NavigationLink(
			 destination: DescriptionView(viewmodel: cartModel, viewModel: description),
			 tag: cartModel.id ?? "",
			 selection: $selectedProductId
		 ) {
			 productHStackView(viewmodel: cartModel)
				 .frame(maxWidth: .infinity)
				 .onTapGesture {
					 if let productId = cartModel.id {
						 description.productid = productId
						 description.isDataFetched = false
						 description.fetchDataDesFromApi()
						 selectedProductId = productId
					 }
				 }
				 .onAppear { // Detect when this view becomes visible
					 selectedIndex = index
					 print(selectedIndex)// Update selected index when the view becomes visible
				 }
			 
		 }
	 }

	 
	 struct BackgroundView: View {
		 var imageURL: String
		 
		 var body: some View {
			 if !imageURL.isEmpty { // Check if imageURL is not empty
				 AsyncImage(url: URL(string: imageURL)) { phase in
					 switch phase {
					 case .empty:
						 Color.clear
					 case .success(let image):
						 image
							 .resizable()
							 .opacity(0.6)
							 
					 case .failure:
						 Color.clear
					 @unknown default:
						 Color.clear
					 }
				 }
		 
				 .frame(width: .infinity, height: UIScreen.main.bounds.height / 1.6)
			 } else {
				 Color.clear // Return a clear color if imageURL is empty
			 }
		 }
	 }
 }
 #Preview {
	 productHstckShelf()
 }*/
