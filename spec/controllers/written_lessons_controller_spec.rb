require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe WrittenLessonsController do

  # This should return the minimal set of attributes required to create a valid
  # WrittenLesson. As you add validations to WrittenLesson, be sure to
  # update the return value of this method accordingly.
  # def valid_attributes
  #   {}
  # end

  # # This should return the minimal set of values that should be in the session
  # # in order to pass any filters (e.g. authentication) defined in
  # # WrittenLessonsController. Be sure to keep this updated too.
  # def valid_session
  #   {}
  # end

  # describe "GET index" do
  #   it "assigns all written_lessons as @written_lessons" do
  #     written_lesson = WrittenLesson.create! valid_attributes
  #     get :index, {}, valid_session
  #     assigns(:written_lessons).should eq([written_lesson])
  #   end
  # end

  # describe "GET show" do
  #   it "assigns the requested written_lesson as @written_lesson" do
  #     written_lesson = WrittenLesson.create! valid_attributes
  #     get :show, {:id => written_lesson.to_param}, valid_session
  #     assigns(:written_lesson).should eq(written_lesson)
  #   end
  # end

  # describe "GET new" do
  #   it "assigns a new written_lesson as @written_lesson" do
  #     get :new, {}, valid_session
  #     assigns(:written_lesson).should be_a_new(WrittenLesson)
  #   end
  # end

  # describe "GET edit" do
  #   it "assigns the requested written_lesson as @written_lesson" do
  #     written_lesson = WrittenLesson.create! valid_attributes
  #     get :edit, {:id => written_lesson.to_param}, valid_session
  #     assigns(:written_lesson).should eq(written_lesson)
  #   end
  # end

  # describe "POST create" do
  #   describe "with valid params" do
  #     it "creates a new WrittenLesson" do
  #       expect {
  #         post :create, {:written_lesson => valid_attributes}, valid_session
  #       }.to change(WrittenLesson, :count).by(1)
  #     end

  #     it "assigns a newly created written_lesson as @written_lesson" do
  #       post :create, {:written_lesson => valid_attributes}, valid_session
  #       assigns(:written_lesson).should be_a(WrittenLesson)
  #       assigns(:written_lesson).should be_persisted
  #     end

  #     it "redirects to the created written_lesson" do
  #       post :create, {:written_lesson => valid_attributes}, valid_session
  #       response.should redirect_to(WrittenLesson.last)
  #     end
  #   end

  #   describe "with invalid params" do
  #     it "assigns a newly created but unsaved written_lesson as @written_lesson" do
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       WrittenLesson.any_instance.stub(:save).and_return(false)
  #       post :create, {:written_lesson => {}}, valid_session
  #       assigns(:written_lesson).should be_a_new(WrittenLesson)
  #     end

  #     it "re-renders the 'new' template" do
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       WrittenLesson.any_instance.stub(:save).and_return(false)
  #       post :create, {:written_lesson => {}}, valid_session
  #       response.should render_template("new")
  #     end
  #   end
  # end

  # describe "PUT update" do
  #   describe "with valid params" do
  #     it "updates the requested written_lesson" do
  #       written_lesson = WrittenLesson.create! valid_attributes
  #       # Assuming there are no other written_lessons in the database, this
  #       # specifies that the WrittenLesson created on the previous line
  #       # receives the :update_attributes message with whatever params are
  #       # submitted in the request.
  #       WrittenLesson.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
  #       put :update, {:id => written_lesson.to_param, :written_lesson => {'these' => 'params'}}, valid_session
  #     end

  #     it "assigns the requested written_lesson as @written_lesson" do
  #       written_lesson = WrittenLesson.create! valid_attributes
  #       put :update, {:id => written_lesson.to_param, :written_lesson => valid_attributes}, valid_session
  #       assigns(:written_lesson).should eq(written_lesson)
  #     end

  #     it "redirects to the written_lesson" do
  #       written_lesson = WrittenLesson.create! valid_attributes
  #       put :update, {:id => written_lesson.to_param, :written_lesson => valid_attributes}, valid_session
  #       response.should redirect_to(written_lesson)
  #     end
  #   end

  #   describe "with invalid params" do
  #     it "assigns the written_lesson as @written_lesson" do
  #       written_lesson = WrittenLesson.create! valid_attributes
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       WrittenLesson.any_instance.stub(:save).and_return(false)
  #       put :update, {:id => written_lesson.to_param, :written_lesson => {}}, valid_session
  #       assigns(:written_lesson).should eq(written_lesson)
  #     end

  #     it "re-renders the 'edit' template" do
  #       written_lesson = WrittenLesson.create! valid_attributes
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       WrittenLesson.any_instance.stub(:save).and_return(false)
  #       put :update, {:id => written_lesson.to_param, :written_lesson => {}}, valid_session
  #       response.should render_template("edit")
  #     end
  #   end
  # end

  # describe "DELETE destroy" do
  #   it "destroys the requested written_lesson" do
  #     written_lesson = WrittenLesson.create! valid_attributes
  #     expect {
  #       delete :destroy, {:id => written_lesson.to_param}, valid_session
  #     }.to change(WrittenLesson, :count).by(-1)
  #   end

  #   it "redirects to the written_lessons list" do
  #     written_lesson = WrittenLesson.create! valid_attributes
  #     delete :destroy, {:id => written_lesson.to_param}, valid_session
  #     response.should redirect_to(written_lessons_url)
  #   end
  # end

end
